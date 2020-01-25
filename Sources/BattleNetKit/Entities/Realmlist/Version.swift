import Foundation

public struct Version: CustomStringConvertible, Codable {
    public let major: UInt32
    public let minor: UInt32
    public let patch: UInt32
    public let build: UInt32

    init(jam: JamJSONGameVersion) {
        self.major = jam.versionMajor
        self.minor = jam.versionMinor
        self.patch = jam.versionRevision
        self.build = jam.versionBuild
    }

    public var description: String {
        return "\(major).\(minor).\(patch)" + " (" + String(build) + ")"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}
