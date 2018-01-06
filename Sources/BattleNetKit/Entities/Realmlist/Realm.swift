//
//  Realm.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public typealias Realmlist = [Subregion: [RealmlistEntry]]

public struct RealmlistEntry: Codable {
    let realm: Realm
    let addresses: [Address]
}

public struct Realm: Hashable, Equatable, Codable {
    let name: String
    let supportedVersion: Version
    let identifier: UInt64
    
    init(jam: JamJSONRealmEntry) {
        self.name = jam.name
        self.supportedVersion = Version(jam: jam.version)
        self.identifier = UInt64(jam.wowRealmAddress)
    }
    
    public var hashValue: Int {
        return identifier.hashValue
    }
    
    public static func ==(lhs: Realm, rhs: Realm) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
