//
//  JamJSONRealmEntry.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

struct JamJSONRealmEntry: Codable {
    let wowRealmAddress: UInt32
    let cfgTimezonesID: Int32
    let populationState: Int32
    let version: JamJSONGameVersion
    let cfgRealmsID: Int32
    let flags: UInt32
    let name: String
    let cfgConfigsID: Int32
    let cfgLanguagesID: Int32
}
