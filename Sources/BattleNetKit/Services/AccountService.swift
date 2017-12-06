//
//  AccountService.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

class AccountService: ServiceType {
    var id: UInt32? = nil
    static let name = "bnet.protocol.account.AccountService"

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
    
    static func handles(_ method: MethodType) -> Bool {
        return type(of: method) == Method.self
    }
    
    enum Method: Int, MethodType {
        case createGameAccount = 14
        
        var name: String {
            switch self {
            case .createGameAccount: return "CreateGameAccount"
            }
        }
        
        var responseType: Message.Type {
            switch self {
            case .createGameAccount: return GameAccountHandle.self
            }
        }
        
        var requestType: Message.Type {
            switch self {
            case .createGameAccount: return CreateGameAccountRequest.self
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}
