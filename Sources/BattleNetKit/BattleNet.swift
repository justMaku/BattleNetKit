//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation

struct ExportedService<Service: ServiceType> {
    let id: UInt32
    let service: Service
}

struct ImportedService<Service: ServiceType> {
    let id: UInt32
    let service: Service
}

final public class BattleNet {
    
    enum Error: Swift.Error {
        case invalidRemoteInvocation(method: UInt32, service: UInt32, message: Message?)
        case invalidLocalInvocation(method: String, service: String, message: Message)
        case unknownService(serviceId: UInt32)
    }
    
    let connection: Connection
    let region: Region
    
    let connectionService = ConnectionService()
    
    fileprivate var exportedServices: [ServiceType] = []
    fileprivate var importedServices: [ServiceType] = []
    
    public init(region: Region) throws {
        self.region = region
        self.connection = try Connection(region: region)
        self.connection.delegate = self
        
        importedServices = [
            AuthenticationServerService(),
            ChallengeService(),
            GameUtilitiesService(),
            GameMasterService(),
            NotificationService(),
            PresenceService(),
            ChannelService(),
            ChannelOwnerService(),
            ChannelInvitationService(),
            FriendsService(),
            AccountService(),
            ResourceService()
        ]
        
        exportedServices = [
            AuthenticationClientService(),
            GameMasterSubscriberService(),
            GameFactorySubscriberService(),
            NotificationListenerService(),
            ChannelSubscriberService(),
            ChannelInvitationNotifyService(),
            FriendsNotify(),
            ChallengeNotifyService(),
            AccountNotifyService()
        ]
    }
    
    public func connect() throws {
        try connection.connect()
        try register()
        try connection.run()
    }
    
    private func register() throws {
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
        
        try call(method: ConnectionService.Method.connect, on: connectionService, with: connectRequest) { [weak self] response in
            guard let services = self?.importedServices else {
                return
            }
            
            guard let connectResponse = response.message as? ConnectResponse else {
                return
            }
            
            for (key, var service) in services.enumerated() {
                let id = connectResponse.bindResponse.importedServiceID[key]
                service.id = id
            }
            
            do {
                try self?.login()
            } catch let error {
                print(error)
            }
        }
    }
    
    func login() throws {
        var logonRequest = LogonRequest()
        logonRequest.program = "WTCG"
        logonRequest.locale = "enGB"
        logonRequest.platform = "And"
        logonRequest.version = "0"
        logonRequest.applicationVersion = 20457
        logonRequest.publicComputer = false
        logonRequest.allowLogonQueueNotifications = true
        logonRequest.webClientVerification = true
        
        guard let s = try importedService(with: 1) as? AuthenticationServerService else {
            return
        }
        
        try call(method: AuthenticationServerService.Method.logon, on: s, with: logonRequest)
    }
    
    func echo(packet: Packet) throws {
        guard let ping = packet.message as? EchoResponse else {
            throw Error.invalidRemoteInvocation(method: packet.header.methodID, service: packet.header.serviceID, message: packet.message)
        }
        
        var pong = EchoRequest()
        pong.time = ping.time
        pong.payload = ping.payload
        
        var header = Header()
        header.serviceID = ReplyService.id
        header.size = try UInt32(pong.serializedData().count)
        header.token = packet.header.token
        
        let packet = Packet(header: header, message: pong)
        connection.queue(packet)
    }
    
    func call<Service: ServiceType, Method: MethodType>(method: Method, on service: Service, with message: Message, completion: Connection.CompletionBlock? = nil) throws {
        
        guard type(of: message) == method.requestType else {
            throw Error.invalidLocalInvocation(method: method.name, service: Service.name, message: message)
        }
        
        var header = Header()
        header.methodID = method.id
        header.serviceID = service.id ?? 0
        header.size = try UInt32(message.serializedData().count)
        
        let packet = Packet(header: header, message: message)
        
        if let completion = completion {
            connection.queue(packet, completion: completion, responseType: method.responseType)
        } else {
            connection.queue(packet)
        }
    }
}

extension BattleNet: ConnectionDelegate {
    func handle(_ packet: Packet, context: Connection.Context?) throws {        
        switch packet.header.serviceID {
        case ConnectionService.id:
            switch packet.header.methodID {
            case ConnectionService.Method.echo.id:
                try echo(packet: packet)
            default: throw Error.invalidRemoteInvocation(method: packet.header.methodID, service: packet.header.serviceID, message: packet.message)
            }
        case ReplyService.id:
            guard let context = context else {
                return
            }
            
            switch context {
            case .noReply(_): return
            case .reply(_, let completionBlock, _):
                completionBlock(packet)
            }
        default: throw Error.unknownService(serviceId: packet.header.serviceID)
        }
    }
    
    func exportedService(with id: UInt32) throws -> ServiceType  {
        switch id {
        case ConnectionService.id:
            return self.connectionService
        default:
            if let service = exportedServices.first(where: { service in service.id == id }) {
                return service
            }
        }
        
        throw Error.unknownService(serviceId: id)
    }
    
    func importedService(with id: UInt32) throws -> ServiceType  {
        switch id {
        case ConnectionService.id:
            return self.connectionService
        default:
            if let service = importedServices.first(where: { service in service.id == id }) {
                return service
            }
        }
        
        throw Error.unknownService(serviceId: id)
    }
}
