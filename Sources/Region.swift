//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

public enum Region: String {
    case eu
    case us
    
    var host: String {
        return self.rawValue + ".actual.battle.net"
    }
}
