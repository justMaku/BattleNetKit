import Foundation

public struct JSONRealmListTicketIdentity: Codable {
    let gameAccountID: UInt64
    let gameAccountRegion: UInt32

    init(entityID: Bgs_Protocol_EntityId) throws {
        self.gameAccountID = entityID.low
        self.gameAccountRegion = try Region(from: entityID).rawValue
    }
}
