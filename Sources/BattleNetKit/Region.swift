//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

public enum Region: UInt32, Codable {
    case unknown = 0
    case us = 1
    case eu = 2
    case test = 98

    var host: String {
        return self.name + ".actual.battle.net"
    }
    
    var name: String {
        switch self {
        case .us: return "us"
        case .eu: return "eu"
        case .test: return "test"
        case .unknown: return "unk"
        }
    }
}
