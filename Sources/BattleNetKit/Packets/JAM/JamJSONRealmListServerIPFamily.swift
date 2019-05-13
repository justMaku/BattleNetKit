import Foundation

public struct JamJSONRealmListServerIPFamily: Codable {
    let family: Int8
    let addresses: [JamJSONRealmListServerIPAddress]
}
