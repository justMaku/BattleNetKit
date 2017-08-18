//
//  AuthenticationService.swift
//  OstaraKit
//
//  Created by Michał Kałużny on 04/08/2017.
//
//

import Foundation

class AuthenticationService: ServiceType {
    let id: UInt32 = 1
    
    static let name = "bnet.protocol.authentication.AuthenticationClient"
    
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
        
        static var all: [AuthenticationService.Method] {
            return [.moduleLoad, .moduleMessage, .accountSettings, .serverStateChange, .logonComplete, .memModuleLoad, .logonUpdate, .logonQueueUpdate, .logonQueueEnd, .gameAccountSelected]
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}
