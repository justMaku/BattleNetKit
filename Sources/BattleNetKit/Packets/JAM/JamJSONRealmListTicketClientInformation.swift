//
//  JamJSONRealmListTicketClientInformation.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

struct JamJSONRealmListTicketClientInformation: Codable {
    let platform: UInt32
    let currentTime: Int32
    let buildVariant: String
    let timeZone: String
    let versionDataBuild: UInt32
    let audioLocale: UInt32
    let version: JamJSONGameVersion
    let secret: [UInt8]
    let type: UInt32
    let textLocale: UInt32
}
