//
//  JamJSONRealmListUpdatePart.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public struct JamJSONRealmListUpdatePart: Codable {
    public let update: JamJSONRealmEntry
    public let deleting: Bool
}

