//
//  Address.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 06.01.18.
//

import Foundation

public struct Address: CustomStringConvertible, Codable {
    public var description: String
    
    let port: UInt16
    let address: String
    
    init(jam: JamJSONRealmListServerIPAddress) {
        self.port = jam.port
        self.address = jam.ip
        self.description = jam.ip + ":" + String(jam.port)
    }
}
