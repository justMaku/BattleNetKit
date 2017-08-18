//
//  ConnectionService.swidt
//  OstaraKit
//
//  Created by Michał Kałużny on 04/08/2017.
//
//

import Foundation

class ConnectionService: ServiceType {
    let id: UInt32 = 0
    static let name = "bnet.protocol.connection.ConnectionService"
    
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
                default: fatalError()
            }
        }
        
        var requestType: Message.Type {
            switch self {
                case .connect: return ConnectRequest.self
                default: fatalError()
            }
        }
        
        static var all: [Method] {
            return [.connect, .bind, .echo, .forceDisconnect, .keepAlive, .encrypt, .requestDisconnect]
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}

