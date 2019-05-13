import Foundation

public struct JamJSONGameVersion: Codable {
    let versionMajor: UInt32
    let versionMinor: UInt32
    let versionRevision: UInt32
    let versionBuild: UInt32
}
