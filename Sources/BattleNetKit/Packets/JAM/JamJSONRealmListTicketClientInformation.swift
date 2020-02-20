import Foundation

struct JamJSONRealmListTicketClientInformation: Codable {
    let platform: UInt32
    let platformType: UInt32
    let clientArch: UInt32
    let systemArch: UInt32
    let currentTime: Int32
    let buildVariant: String
    let timeZone: String
    let systemVersion: String
    let versionDataBuild: UInt32
    let audioLocale: UInt32
    let version: JamJSONGameVersion
    let secret: [UInt8]
    let type: UInt32
    let textLocale: UInt32
}
