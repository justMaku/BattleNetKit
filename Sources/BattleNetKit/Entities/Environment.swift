import Foundation

public enum Environment: String {
    case live
    case classic

    var attributeVersion: Bgs_Protocol_Attribute.Version {
        switch self {
        case .classic: return .classic
        case .live: return .live
        }
    }
}
