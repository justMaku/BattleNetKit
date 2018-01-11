//
//  GamesAPI.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.12.17.
//

import Foundation
import Result

protocol ConnectionAPIDelegate {
    func connected(to: Region) throws
    func bound(to: Region) throws
    func disconnected(from: Region) throws
    func failed(with: Swift.Error) throws
}

public class ConnectionAPI: API {
    enum Error: Swift.Error {
        case invalidRemoteInvocation(method: UInt32, service: UInt32, message: Message?)
        case invalidLocalInvocation(method: String, service: String, message: Message)
        
        case unknownService(serviceId: UInt32)
        case serviceWithoutId(service: ServiceType)
        case serviceNotRegistered(type: ServiceType.Type)
        case noServiceCanHandle(method: MethodType)
        case noServiceCanSend(method: MethodType)
        case responseWithoutContext(packet: Packet)
        case responseToNonrespondingMessage(packet: Packet)
    }
    
    struct Handler {
        let service: UInt32
        let method: UInt32
        let closure: (_ packet: Packet) throws -> Void
    }
    
    let client: BattleNet
    let connectionService: ConnectionService = .init()
    let replyService: ReplyService = .init()
    
    var delegate: ConnectionAPIDelegate? = nil

    fileprivate var importedServices: [ServiceType] = [] // Services that we're going to be calling on the servers
    fileprivate var exportedServices: [ServiceType] = [] // Services that server can call on the client.
    fileprivate var handlers: [Handler] = []
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(importedService: ServiceType) {
        self.importedServices.append(importedService)
    }
    
    func bind(exportedService: ServiceType) {
        self.exportedServices.append(exportedService)
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {
        self.bind(exportedService: connectionService)
        self.bind(importedService: connectionService)
    }
    
    func register(with connectionAPI: ConnectionAPI) throws {
        connectionAPI.register(Handler(service: ConnectionService.id, method: ConnectionService.Method.echo.id, closure: self.handlePing))
    }
    
    func call(_ method: MethodType, message: Message, completion: Connection.CompletionBlock? = nil) throws {
        let packet = try wrap(method: method, message: message)
        
        try send(packet, completion: completion)
    }
    
    func reply(to packet: Packet, with message: Message) throws {
        var header = Header()
        
        header.serviceID = ReplyService.id
        header.token = packet.header.token
        header.size = try UInt32(message.serializedData().count)
        
        let packet = Packet(header: header, message: message)
        
        try send(packet)
    }
    
    private func send(_ packet: Packet, completion: Connection.CompletionBlock? = nil) throws {
        if let completion = completion {
            do {
                let service = try self.service(importedAs: packet.header.serviceID)
                let method = try type(of: service).method(with: packet.header.methodID)
                client.connection.queue(packet, completion: completion, responseType: method.responseType)
            } catch {
                throw Error.invalidRemoteInvocation(method: packet.header.methodID, service: packet.header.serviceID, message: packet.message)
            }
        } else {
            client.connection.queue(packet)
        }
    }
    
    private func wrap(method: MethodType, message: Message) throws -> Packet {
        let service = try self.service(sending: method)
        
        guard type(of: message) == method.requestType else {
            throw Error.invalidLocalInvocation(method: method.name, service: type(of: service).name, message: message)
        }
        
        var header = Header()
        header.methodID = method.id
        header.serviceID = service.id ?? 0
        header.size = try UInt32(message.serializedData().count)
        
        let packet = Packet(header: header, message: message)
        return packet
    }
}

// MARK: Public Interface
extension ConnectionAPI {
    func connect() throws {
        Log.debug("Attempting to connect to region \(client.connection.region)", domain: .connection)
        client.connection.delegate = self
        try client.connection.connect()
        try client.connection.run()
    }
    
    func bind() throws {
        var connectRequest = ConnectRequest()
        var bindRequest = BindRequest()
        
        var i: UInt32 = 1
        
        var boundServices: [BoundService] = []
        for var service in exportedServices {
            var boundService = BoundService()
            boundService.hash = try service.hash()
            
            if service.id == nil {
                service.id = i
                i += 1
            }
            boundService.id = service.id!
            boundServices.append(boundService)
        }
        
        bindRequest.exportedServices = boundServices
        bindRequest.importedServicesHash = try importedServices.map { try $0.hash() }
        
        connectRequest.bindRequest = bindRequest
        
        try call(ConnectionService.Method.connect, message: connectRequest) { (result) in
            let response: ConnectResponse = try result.dematerialize().extract()
            
            for (key, var service) in self.importedServices.enumerated() {
                let id = response.bindResponse.importedServiceID[key]
                service.id = id
            }
            
            Log.debug("Sucessfully bound to Aurora", domain: .connection)
            try self.delegate?.bound(to: self.client.connection.region)
        }
    }
}

// MARK: Response Handlers
extension ConnectionAPI {
    func handlePing(packet: Packet) throws {
        Log.debug("Ping", domain: .connection)
        guard let ping = packet.message as? EchoResponse else {
            throw Error.invalidRemoteInvocation(method: packet.header.methodID, service: packet.header.serviceID, message: packet.message)
        }
        
        var pong = EchoRequest()
        pong.time = ping.time
        pong.payload = ping.payload
        
        try reply(to: packet, with: pong)
        Log.debug("Pong", domain: .connection)
    }
}

// MARK: Connection Delegate
extension ConnectionAPI: ConnectionDelegate {
    func connection(_: Connection, didConnectToRegion region: Region) throws {
        Log.debug("Connected to region: \(region)", domain: .connection)
        try self.delegate?.connected(to: region)

        try self.bind()
    }
    
    func handle(_ packet: Packet, context: Connection.Context?) throws {
        Log.debug("Handling packet \(packet.header.token)", domain: .connection)

        guard packet.header.serviceID != ReplyService.id else {
            return try handle(response: packet, context: context)
        }

        let handlers = self.handlers(for: packet.header.serviceID, method: packet.header.methodID)
        
        if handlers.count == 0 {
            Log.warning("Unhandled call to service \(packet.header.serviceID), method: \(packet.header.methodID)", domain: .connection)
        }
        
        try handlers.forEach { try $0.closure(packet) }
    }
    
    func handle(response packet: Packet, context ctx: Connection.Context?) throws {
        guard let context = ctx else {
            throw Error.responseWithoutContext(packet: packet)
        }
        
        switch context {
        case .noReply: throw Error.responseToNonrespondingMessage(packet: packet)
        case .reply(_, let completionBlock, _):
            try completionBlock(Result(value: packet))
        }
    }
    
    func handle(_ error: Swift.Error) throws {
        Log.error(error.localizedDescription)
        try self.delegate?.failed(with: error)
    }
}

// MARK: Handlers Management
extension ConnectionAPI {
    func handlers(for service: UInt32, method: UInt32) -> [Handler] {
        return handlers.filter { $0.service == service && $0.method == method }
    }
    
    func register(_ handler: Handler) {
        handlers.append(handler)
    }
}

// MARK: Service Retrieval
extension ConnectionAPI {
    func service(handling method: MethodType) throws -> ServiceType {
        guard let service = exportedServices.filter({ type(of: $0).handles(method) }).first else {
            throw Error.noServiceCanHandle(method: method)
        }
        
        return service
    }
    
    func service(sending method: MethodType) throws -> ServiceType {
        guard let service = importedServices.filter({ type(of: $0).handles(method) }).first else {
            throw Error.noServiceCanSend(method: method)
        }

        return service
    }
    
    func service(exportedAs id: UInt32) throws -> ServiceType {
        return try service(with: id, in: exportedServices)
    }
    
    func service(importedAs id: UInt32) throws -> ServiceType {
        return try service(with: id, in: importedServices)
    }
    
    func service<Service: ServiceType>(of type: Service.Type) throws -> Service {
        let allServices = importedServices + exportedServices
        guard let service = allServices.filter({ Swift.type(of: $0) == type }).first as? Service else {
            throw Error.serviceNotRegistered(type: type)
        }
        
        return service
    }
    
    private func service(with id: UInt32, in services: [ServiceType]) throws -> ServiceType {
        switch id {
        case ConnectionService.id: return connectionService
        case ReplyService.id: return replyService
        case _:
            guard let service = services.filter({ $0.id == id }).first else {
                throw Error.unknownService(serviceId: id)
            }
            
            return service
        }
    }
}
