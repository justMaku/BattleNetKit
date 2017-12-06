//
//  ChallangeNotifyService.swift
//  OstaraKit
//
//  Created by Michał Kałużny on 04/08/2017.
//
//

import Foundation

class ChallengeNotifyService: ServiceType {
    var id: UInt32? = nil
    
    static let name = "bnet.protocol.challenge.ChallengeNotify"
    
    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }
        
        return method
    }
    
    static func handles(_ type: MethodType) -> Bool {
        return type(of: type) == Method.self
    }
    
    enum Method: Int, MethodType {
        case challengeUser = 1
        case challengeResult = 2
        case onExternalChallenge = 3
        case onExternalChallengeResult = 4
        
        var name: String {
            switch self {
            case .challengeUser: return "ChallengeUser"
            case .challengeResult: return "ChallengeResult"
            case .onExternalChallenge: return "OnExternalChallenge"
            case .onExternalChallengeResult: return "OnExternalChallengeResult"
            }
        }
        
        var requestType: Message.Type {
            switch self {
            default: fatalError()
            }
        }
        
        var responseType: Message.Type {
            switch self {
            case .onExternalChallenge: return ChallengeExternalRequest.self
            default: fatalError()
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}

