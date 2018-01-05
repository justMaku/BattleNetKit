//
//  ConnectionService.swidt
//  OstaraKit
//
//  Created by Michał Kałużny on 04/08/2017.
//
//

import Foundation

class ConnectionService: ServiceType {
    static let id: UInt32 = 0
    static let name = "bnet.protocol.connection.ConnectionService"
    var id: UInt32? = ConnectionService.id
    
    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
    
    static func handles(_ type: MethodType) -> Bool {
        return Swift.type(of: type) == Method.self
    }
    
    enum Method: Int, MethodType {
        case connect = 1
        case bind = 2
        case echo = 3
        case forceDisconnect = 4
        case keepAlive = 5
        case encrypt = 6
        case requestDisconnect = 7
        
        var name: String {
            switch self {
                case .connect: return "Connect"
                case .bind: return "Bind"
                case .echo: return "Echo"
                case .forceDisconnect: return "ForceDisconnect"
                case .keepAlive: return "KeepAlive"
                case .encrypt: return "Encrypt"
                case .requestDisconnect: return "RequestDisconnect"
            }
        }
        
        var responseType: Message.Type {
            switch self {
                case .connect: return ConnectResponse.self
                case .echo: return EchoResponse.self
                default: fatalError()
            }
        }
        
        var requestType: Message.Type {
            switch self {
                case .connect: return ConnectRequest.self
                case .echo: return EchoRequest.self
                default: fatalError()
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}

