//
//  Address.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 06.01.18.
//

import Foundation

public struct Address: CustomStringConvertible, Codable {
    public var description: String {
        return self.address + ":" + String(self.port)
    }
    
    public let port: UInt16
    public let address: String
    
    init(jam: JamJSONRealmListServerIPAddress) {
        self.port = jam.port
        self.address = jam.ip
    }
    
    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}
