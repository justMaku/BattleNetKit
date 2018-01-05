//
//  JamJSONRealmListServerIPFamily.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation

public struct JamJSONRealmListServerIPFamily: Codable {
    let family: Int8
    let addresses: [JamJSONRealmListServerIPAddress]
}
