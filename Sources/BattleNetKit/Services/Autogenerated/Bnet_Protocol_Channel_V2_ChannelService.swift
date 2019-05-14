import Foundation

class Bnet_Protocol_Channel_V2_ChannelService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.v2.ChannelService"

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
        case CreateChannel = 2
        case DissolveChannel = 3
        case GetChannel = 4
        case GetPublicChannelTypes = 5
        case FindChannel = 6
        case Subscribe = 10
        case Unsubscribe = 11
        case SetAttribute = 21
        case SetPrivacyLevel = 22
        case SendMessage = 23
        case SetTypingIndicator = 24
        case Join = 30
        case Leave = 31
        case Kick = 32
        case SetMemberAttribute = 40
        case AssignRole = 41
        case UnassignRole = 42
        case SendInvitation = 50
        case AcceptInvitation = 51
        case DeclineInvitation = 52
        case RevokeInvitation = 53
        case SendSuggestion = 60
        case GetJoinVoiceToken = 70

        var name: String {
            switch self {
            case .CreateChannel: return "CreateChannel"
            case .DissolveChannel: return "DissolveChannel"
            case .GetChannel: return "GetChannel"
            case .GetPublicChannelTypes: return "GetPublicChannelTypes"
            case .FindChannel: return "FindChannel"
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .SetAttribute: return "SetAttribute"
            case .SetPrivacyLevel: return "SetPrivacyLevel"
            case .SendMessage: return "SendMessage"
            case .SetTypingIndicator: return "SetTypingIndicator"
            case .Join: return "Join"
            case .Leave: return "Leave"
            case .Kick: return "Kick"
            case .SetMemberAttribute: return "SetMemberAttribute"
            case .AssignRole: return "AssignRole"
            case .UnassignRole: return "UnassignRole"
            case .SendInvitation: return "SendInvitation"
            case .AcceptInvitation: return "AcceptInvitation"
            case .DeclineInvitation: return "DeclineInvitation"
            case .RevokeInvitation: return "RevokeInvitation"
            case .SendSuggestion: return "SendSuggestion"
            case .GetJoinVoiceToken: return "GetJoinVoiceToken"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .CreateChannel: return Bgs_Protocol_NoData.self
            case .DissolveChannel: return Bgs_Protocol_NoData.self
            case .GetChannel: return Bgs_Protocol_Channel_V2_GetChannelResponse.self
            case .GetPublicChannelTypes: return Bgs_Protocol_Channel_V2_GetPublicChannelTypesResponse.self
            case .FindChannel: return Bgs_Protocol_NoData.self
            case .Subscribe: return Bgs_Protocol_Channel_V2_SubscribeResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .SetAttribute: return Bgs_Protocol_NoData.self
            case .SetPrivacyLevel: return Bgs_Protocol_NoData.self
            case .SendMessage: return Bgs_Protocol_NoData.self
            case .SetTypingIndicator: return Bgs_Protocol_NoData.self
            case .Join: return Bgs_Protocol_NoData.self
            case .Leave: return Bgs_Protocol_NoData.self
            case .Kick: return Bgs_Protocol_NoData.self
            case .SetMemberAttribute: return Bgs_Protocol_NoData.self
            case .AssignRole: return Bgs_Protocol_NoData.self
            case .UnassignRole: return Bgs_Protocol_NoData.self
            case .SendInvitation: return Bgs_Protocol_NoData.self
            case .AcceptInvitation: return Bgs_Protocol_NoData.self
            case .DeclineInvitation: return Bgs_Protocol_NoData.self
            case .RevokeInvitation: return Bgs_Protocol_NoData.self
            case .SendSuggestion: return Bgs_Protocol_NoData.self
            case .GetJoinVoiceToken: return Bgs_Protocol_Channel_V2_GetJoinVoiceTokenResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .CreateChannel: return Bgs_Protocol_Channel_V2_CreateChannelRequest.self
            case .DissolveChannel: return Bgs_Protocol_Channel_V2_DissolveChannelRequest.self
            case .GetChannel: return Bgs_Protocol_Channel_V2_GetChannelRequest.self
            case .GetPublicChannelTypes: return Bgs_Protocol_Channel_V2_GetPublicChannelTypesRequest.self
            case .FindChannel: return Bgs_Protocol_Channel_V2_FindChannelRequest.self
            case .Subscribe: return Bgs_Protocol_Channel_V2_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Channel_V2_UnsubscribeRequest.self
            case .SetAttribute: return Bgs_Protocol_Channel_V2_SetAttributeRequest.self
            case .SetPrivacyLevel: return Bgs_Protocol_Channel_V2_SetPrivacyLevelRequest.self
            case .SendMessage: return Bgs_Protocol_Channel_V2_SendMessageRequest.self
            case .SetTypingIndicator: return Bgs_Protocol_Channel_V2_SetTypingIndicatorRequest.self
            case .Join: return Bgs_Protocol_Channel_V2_JoinRequest.self
            case .Leave: return Bgs_Protocol_Channel_V2_LeaveRequest.self
            case .Kick: return Bgs_Protocol_Channel_V2_KickRequest.self
            case .SetMemberAttribute: return Bgs_Protocol_Channel_V2_SetMemberAttributeRequest.self
            case .AssignRole: return Bgs_Protocol_Channel_V2_AssignRoleRequest.self
            case .UnassignRole: return Bgs_Protocol_Channel_V2_UnassignRoleRequest.self
            case .SendInvitation: return Bgs_Protocol_Channel_V2_SendInvitationRequest.self
            case .AcceptInvitation: return Bgs_Protocol_Channel_V2_AcceptInvitationRequest.self
            case .DeclineInvitation: return Bgs_Protocol_Channel_V2_DeclineInvitationRequest.self
            case .RevokeInvitation: return Bgs_Protocol_Channel_V2_RevokeInvitationRequest.self
            case .SendSuggestion: return Bgs_Protocol_Channel_V2_SendSuggestionRequest.self
            case .GetJoinVoiceToken: return Bgs_Protocol_Channel_V2_GetJoinVoiceTokenRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
