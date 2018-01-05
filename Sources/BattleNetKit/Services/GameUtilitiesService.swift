//
//  GameUtilitiesService.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

class GameUtilitiesService: ServiceType {
    var id: UInt32? = nil
    static let name = "bnet.protocol.game_utilities.GameUtilities"
    
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
        case processClientRequest = 1
        case getAllValuesForAttribute = 10

        
        var name: String {
            switch self {
            case .processClientRequest: return "ProcessClientRequest"
            case .getAllValuesForAttribute: return "GetAllValuesForAttribute"
            }
        }
        
        var responseType: Message.Type {
            switch self {
            case .processClientRequest: return ClientResponse.self
            case .getAllValuesForAttribute: return GetAllValuesForAttributeResponse.self
            }
        }
        
        var requestType: Message.Type {
            switch self {
            case .processClientRequest: return ClientRequest.self
            case .getAllValuesForAttribute: return GetAllValuesForAttributeRequest.self
            }
        }
        
        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }
}
