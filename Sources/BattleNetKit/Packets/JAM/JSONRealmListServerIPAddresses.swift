//
//  JSONRealmListServerIPAddresses.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public struct JSONRealmListServerIPAddresses: Codable {
    let families: [JamJSONRealmListServerIPFamily]
}
