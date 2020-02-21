import Foundation

public enum Environment: String {
    case live
    case classic

    var clientVersion: JamJSONGameVersion {
        switch self {
        case .live:
            return JamJSONGameVersion(versionMajor: 8, versionMinor: 3,  versionRevision: 0, versionBuild: 33169)
        case .classic:
            return JamJSONGameVersion(versionMajor: 1, versionMinor: 13, versionRevision: 3, versionBuild: 32887)
        }
    }

    var attributeVersion: Bgs_Protocol_Attribute.Version {
        switch self {
        case .classic: return .classic
        case .live: return .live
        }
    }
}
