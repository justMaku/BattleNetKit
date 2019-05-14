import Foundation

class Bnet_Protocol_Friends_FriendsNotify: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.friends.FriendsNotify"

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
        case OnFriendAdded = 1
        case OnFriendRemoved = 2
        case OnReceivedInvitationAdded = 3
        case OnReceivedInvitationRemoved = 4
        case OnSentInvitationAdded = 5
        case OnSentInvitationRemoved = 6
        case OnUpdateFriendState = 7

        var name: String {
            switch self {
            case .OnFriendAdded: return "OnFriendAdded"
            case .OnFriendRemoved: return "OnFriendRemoved"
            case .OnReceivedInvitationAdded: return "OnReceivedInvitationAdded"
            case .OnReceivedInvitationRemoved: return "OnReceivedInvitationRemoved"
            case .OnSentInvitationAdded: return "OnSentInvitationAdded"
            case .OnSentInvitationRemoved: return "OnSentInvitationRemoved"
            case .OnUpdateFriendState: return "OnUpdateFriendState"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnFriendAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnFriendRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSentInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSentInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnUpdateFriendState: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnFriendAdded: return Bgs_Protocol_Friends_V1_FriendNotification.self
            case .OnFriendRemoved: return Bgs_Protocol_Friends_V1_FriendNotification.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_Friends_V1_InvitationNotification.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_Friends_V1_InvitationNotification.self
            case .OnSentInvitationAdded: return Bgs_Protocol_Friends_V1_SentInvitationAddedNotification.self
            case .OnSentInvitationRemoved: return Bgs_Protocol_Friends_V1_SentInvitationRemovedNotification.self
            case .OnUpdateFriendState: return Bgs_Protocol_Friends_V1_UpdateFriendStateNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
