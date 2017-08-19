//
//  AuthenticationClientService.swift
//  OstaraKit
//
//  Created by Michał Kałużny on 04/08/2017.
//
//

import Foundation

class AuthenticationServerService: ServiceType {
    var id: UInt32? = nil
    static let name = "bnet.protocol.authentication.AuthenticationServer"
    
    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
    
    enum Method: Int, MethodType {
        case logon = 1
        
        var name: String {
            switch self {
            case .logon: return "Logon"
            }
        }
        
        var requestType: Message.Type {
            switch self {
            case .logon: return LogonRequest.self
            }
        }
        
        var responseType: Message.Type {
            switch self {
            default: fatalError()
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}

class AuthenticationClientService: ServiceType {
    var id: UInt32? = nil
    static let name = "bnet.protocol.authentication.AuthenticationClient"
    
    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
    
    enum Method: Int, MethodType {
        case moduleLoad = 1
        case moduleMessage = 2
        case accountSettings = 3
        case serverStateChange = 4
        case logonComplete = 5
        case memModuleLoad = 6
        case logonUpdate = 10
        case versionInfoUpdated = 11
        case logonQueueUpdate = 12
        case logonQueueEnd = 13
        case gameAccountSelected = 14
        
        var name: String {
            switch self {
            case .moduleLoad: return "ModuleLoad"
            case .moduleMessage: return "ModuleMessage"
            case .accountSettings: return "AccountSettings"
            case .serverStateChange: return "ServerStateChange"
            case .logonComplete: return "LogonComplete"
            case .memModuleLoad: return "MemModuleLoad"
            case .logonUpdate: return "LogonUpdate"
            case .versionInfoUpdated: return "VersionInfoUpdated"
            case .logonQueueUpdate: return "LogonQueueUpdate"
            case .logonQueueEnd: return "LogonQueueEnd"
            case .gameAccountSelected: return "GameAccountSelected"
            }
        }
        
        var requestType: Message.Type {
            switch self {
            default: fatalError()
            }
        }
    
        var responseType: Message.Type {
            switch self {
            default: fatalError()
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}
