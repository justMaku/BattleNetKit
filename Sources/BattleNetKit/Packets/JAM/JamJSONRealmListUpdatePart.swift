//
//  JamJSONRealmListUpdatePart.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public struct JamJSONRealmListUpdatePart: Codable {
    let update: JamJSONRealmEntry
    let deleting: Bool
}

