//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

struct ExportedService<Service: ServiceType> {
    let id: UInt32
    let service: Service
}

struct ImportedService<Service: ServiceType> {
    let id: UInt32
    let service: Service
}

public class BattleNet {
    
    enum Error: Swift.Error {
        case invalidInvocation(method: String, service: String, message: Message)
        case unknownService(serviceId: UInt32)
    }
    
    let connection: Connection
    let region: Region
    
    let connectionService = ConnectionService()
    let authenticationService = AuthenticationService()
    
    public init(region: Region) throws {
        self.region = region
        self.connection = try Connection(region: region)
        self.connection.delegate = self
    }
    
    public func connect() throws {
        try connection.connect()
        try register()
        try connection.run()
    }
    
    private func register() throws {
        let services = [connectionService]
        
        var connectRequest = ConnectRequest()
        var bindRequest = BindRequest()
        
        bindRequest.exportedServices = try services.map { service in
            var boundService = BoundService()
            boundService.hash = try service.hash()
            boundService.id = service.id
            
            return boundService
        }
        
        bindRequest.importedServicesHash = try services.map { try $0.hash() }
        
        connectRequest.bindRequest = bindRequest
        
        try call(method: ConnectionService.Method.connect, on: connectionService, with: connectRequest)
    }
    
    func call<Service: ServiceType, Method: MethodType>(method: Method, on service: Service, with message: Message) throws {
        
        guard type(of: message) == method.requestType else {
            throw Error.invalidInvocation(method: method.name, service: Service.name, message: message)
        }
        
        var header = Header()
        header.methodID = method.id
        header.serviceID = service.id
        header.size = try UInt32(message.serializedData().count)
        header.token = 0
        
        let packet = Packet(header: header, message: message)
        connection.queue(packet)
    }
}

extension BattleNet: ConnectionDelegate {
    func handle(_ packet: Packet) throws {
        switch packet.header.serviceID {
        case 0: try connectionService.handle(packet)
        default: throw Error.unknownService(serviceId: packet.header.serviceID)
        }
    }
    
    func service(with id: UInt32) throws -> ServiceType  {
        return connectionService
    }
}
