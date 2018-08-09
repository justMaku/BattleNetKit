//
//  Realm.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public typealias Realmlist = [RealmlistSubregionEntry]

public struct RealmlistSubregionEntry: Codable {
    let subregion: Subregion
    let realms: [RealmlistRealmEntry]
    
    init(subregion: Subregion, realms: [RealmlistRealmEntry]) {
        self.subregion = subregion
        self.realms = realms
    }
    
    enum CodingKeys: String, CodingKey {
        case subregion
        case realms
    }
    
    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(subregion.description, forKey: .subregion)
        try container.encode(realms, forKey: .realms)
    }
}

public struct RealmlistRealmEntry: Codable {
    let realm: Realm
    let addresses: [Address]
}

public struct Realm: Hashable, Equatable, Codable {
    public let name: String
    public let supportedVersion: Version
    public let identifier: UInt32
    
    init(jam: JamJSONRealmEntry) {
        self.name = jam.name
        self.supportedVersion = Version(jam: jam.version)
        self.identifier = jam.wowRealmAddress
    }
    
    public var region: UInt32 {
        return UInt32(identifier >> 3 & 0x00_00_00_FF)
    }
    
    public var group: UInt32 {
        return UInt32(identifier >> 2 & 0x00_00_00_FF)
    }
    
    public var id: UInt32 {
        return UInt32(identifier & 0x00_00_FF_FF)
    }
    
    public var hashValue: Int {
        return identifier.hashValue
    }
    
    public static func ==(lhs: Realm, rhs: Realm) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
