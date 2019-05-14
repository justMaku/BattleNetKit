import Foundation

class Bnet_Protocol_UserManager_UserManagerNotify: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.user_manager.UserManagerNotify"

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }

    static func handles(_ method: MethodType) -> Bool {
        return type(of: method) == Method.self
    }

    enum Method: Int, MethodType {
        case OnBlockedPlayerAdded = 1
        case OnBlockedPlayerRemoved = 2
        case OnRecentPlayersAdded = 11
        case OnRecentPlayersRemoved = 12

        var name: String {
            switch self {
            case .OnBlockedPlayerAdded: return "OnBlockedPlayerAdded"
            case .OnBlockedPlayerRemoved: return "OnBlockedPlayerRemoved"
            case .OnRecentPlayersAdded: return "OnRecentPlayersAdded"
            case .OnRecentPlayersRemoved: return "OnRecentPlayersRemoved"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnBlockedPlayerAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnBlockedPlayerRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnRecentPlayersAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnRecentPlayersRemoved: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnBlockedPlayerAdded: return Bgs_Protocol_UserManager_V1_BlockedPlayerAddedNotification.self
            case .OnBlockedPlayerRemoved: return Bgs_Protocol_UserManager_V1_BlockedPlayerRemovedNotification.self
            case .OnRecentPlayersAdded: return Bgs_Protocol_UserManager_V1_RecentPlayersAddedNotification.self
            case .OnRecentPlayersRemoved: return Bgs_Protocol_UserManager_V1_RecentPlayersRemovedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
