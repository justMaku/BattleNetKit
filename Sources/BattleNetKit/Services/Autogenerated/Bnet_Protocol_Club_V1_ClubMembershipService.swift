import Foundation

class Bnet_Protocol_Club_V1_ClubMembershipService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.club.v1.ClubMembershipService"

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
        case Unsubscribe = 2
        case GetState = 3
        case UpdateClubSharedSettings = 4
        case GetStreamMentions = 5
        case RemoveStreamMentions = 6
        case AdvanceStreamMentionViewTime = 7

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .GetState: return "GetState"
            case .UpdateClubSharedSettings: return "UpdateClubSharedSettings"
            case .GetStreamMentions: return "GetStreamMentions"
            case .RemoveStreamMentions: return "RemoveStreamMentions"
            case .AdvanceStreamMentionViewTime: return "AdvanceStreamMentionViewTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Club_V1_Membership_SubscribeResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .GetState: return Bgs_Protocol_Club_V1_Membership_GetStateResponse.self
            case .UpdateClubSharedSettings: return Bgs_Protocol_NoData.self
            case .GetStreamMentions: return Bgs_Protocol_Club_V1_Membership_GetStreamMentionsResponse.self
            case .RemoveStreamMentions: return Bgs_Protocol_NoData.self
            case .AdvanceStreamMentionViewTime: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Club_V1_Membership_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Club_V1_Membership_UnsubscribeRequest.self
            case .GetState: return Bgs_Protocol_Club_V1_Membership_GetStateRequest.self
            case .UpdateClubSharedSettings: return Bgs_Protocol_Club_V1_Membership_UpdateClubSharedSettingsRequest.self
            case .GetStreamMentions: return Bgs_Protocol_Club_V1_Membership_GetStreamMentionsRequest.self
            case .RemoveStreamMentions: return Bgs_Protocol_Club_V1_Membership_RemoveStreamMentionsRequest.self
            case .AdvanceStreamMentionViewTime: return Bgs_Protocol_Club_V1_Membership_AdvanceStreamMentionViewTimeRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
