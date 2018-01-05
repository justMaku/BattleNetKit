//
//  JamJSONRealmListUpdatePart.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

struct JamJSONRealmListUpdatePart: Codable {
    let update: JamJSONRealmEntry
    let deleting: Bool
}

