//
//  JSONRealmListTicketIdentity.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

public struct JSONRealmListTicketIdentity: Codable {
    let gameAccountID: UInt64
    let gameAccountRegion: Region
    
    init(entityID: EntityId) {
        self.gameAccountID = entityID.low
        self.gameAccountRegion = entityID.region
    }
}
