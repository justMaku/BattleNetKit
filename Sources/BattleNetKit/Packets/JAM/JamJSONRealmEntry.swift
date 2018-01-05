//
//  JamJSONRealmEntry.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public struct JamJSONRealmEntry: Codable {
    public let wowRealmAddress: UInt32
    public let cfgTimezonesID: Int32
    public let populationState: Int32
    public let version: JamJSONGameVersion
    public let cfgRealmsID: Int32
    public let flags: UInt32
    public let name: String
    public let cfgConfigsID: Int32
    public let cfgLanguagesID: Int32
}
