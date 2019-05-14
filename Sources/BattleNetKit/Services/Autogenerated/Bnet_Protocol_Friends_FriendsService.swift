import Foundation

class Bnet_Protocol_Friends_FriendsService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.friends.FriendsService"

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
        case Subscribe = 1
        case SendInvitation = 2
        case AcceptInvitation = 3
        case RevokeInvitation = 4
        case DeclineInvitation = 5
        case IgnoreInvitation = 6
        case RemoveFriend = 8
        case ViewFriends = 9
        case UpdateFriendState = 10
        case Unsubscribe = 11
        case RevokeAllInvitations = 12
        case GetFriendList = 13
        case CreateFriendship = 14

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .SendInvitation: return "SendInvitation"
            case .AcceptInvitation: return "AcceptInvitation"
            case .RevokeInvitation: return "RevokeInvitation"
            case .DeclineInvitation: return "DeclineInvitation"
            case .IgnoreInvitation: return "IgnoreInvitation"
            case .RemoveFriend: return "RemoveFriend"
            case .ViewFriends: return "ViewFriends"
            case .UpdateFriendState: return "UpdateFriendState"
            case .Unsubscribe: return "Unsubscribe"
            case .RevokeAllInvitations: return "RevokeAllInvitations"
            case .GetFriendList: return "GetFriendList"
            case .CreateFriendship: return "CreateFriendship"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Friends_V1_SubscribeResponse.self
            case .SendInvitation: return Bgs_Protocol_NoData.self
            case .AcceptInvitation: return Bgs_Protocol_NoData.self
            case .RevokeInvitation: return Bgs_Protocol_NoData.self
            case .DeclineInvitation: return Bgs_Protocol_NoData.self
            case .IgnoreInvitation: return Bgs_Protocol_NoData.self
            case .RemoveFriend: return Bgs_Protocol_NoData.self
            case .ViewFriends: return Bgs_Protocol_Friends_V1_ViewFriendsResponse.self
            case .UpdateFriendState: return Bgs_Protocol_NoData.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .RevokeAllInvitations: return Bgs_Protocol_NoData.self
            case .GetFriendList: return Bgs_Protocol_Friends_V1_GetFriendListResponse.self
            case .CreateFriendship: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Friends_V1_SubscribeRequest.self
            case .SendInvitation: return Bgs_Protocol_Friends_V1_SendInvitationRequest.self
            case .AcceptInvitation: return Bgs_Protocol_Friends_V1_AcceptInvitationRequest.self
            case .RevokeInvitation: return Bgs_Protocol_Friends_V1_RevokeInvitationRequest.self
            case .DeclineInvitation: return Bgs_Protocol_Friends_V1_DeclineInvitationRequest.self
            case .IgnoreInvitation: return Bgs_Protocol_Friends_V1_IgnoreInvitationRequest.self
            case .RemoveFriend: return Bgs_Protocol_Friends_V1_RemoveFriendRequest.self
            case .ViewFriends: return Bgs_Protocol_Friends_V1_ViewFriendsRequest.self
            case .UpdateFriendState: return Bgs_Protocol_Friends_V1_UpdateFriendStateRequest.self
            case .Unsubscribe: return Bgs_Protocol_Friends_V1_UnsubscribeRequest.self
            case .RevokeAllInvitations: return Bgs_Protocol_Friends_V1_RevokeAllInvitationsRequest.self
            case .GetFriendList: return Bgs_Protocol_Friends_V1_GetFriendListRequest.self
            case .CreateFriendship: return Bgs_Protocol_Friends_V1_CreateFriendshipRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
