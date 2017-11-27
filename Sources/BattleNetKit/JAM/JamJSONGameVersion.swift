//
//  JAMVersion.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

internal struct JamJSONGameVersion: Codable {
    let versionMajor: UInt32
    let versionMinor: UInt32
    let versionRevision: UInt32
    let versionBuild: UInt32
}
