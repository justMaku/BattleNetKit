import Foundation

public struct JamJSONRealmListUpdatePart: Codable {
    public let update: JamJSONRealmEntry
    public let deleting: Bool
}
