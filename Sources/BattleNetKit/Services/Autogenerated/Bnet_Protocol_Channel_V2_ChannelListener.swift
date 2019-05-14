import Foundation

class Bnet_Protocol_Channel_V2_ChannelListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.v2.ChannelListener"

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
        case OnMemberAdded = 3
        case OnMemberRemoved = 4
        case OnMemberAttributeChanged = 5
        case OnMemberRoleChanged = 6
        case OnSendMessage = 10
        case OnTypingIndicator = 11
        case OnAttributeChanged = 16
        case OnPrivacyLevelChanged = 17
        case OnInvitationAdded = 18
        case OnInvitationRemoved = 19
        case OnSuggestionAdded = 20

        var name: String {
            switch self {
            case .OnMemberAdded: return "OnMemberAdded"
            case .OnMemberRemoved: return "OnMemberRemoved"
            case .OnMemberAttributeChanged: return "OnMemberAttributeChanged"
            case .OnMemberRoleChanged: return "OnMemberRoleChanged"
            case .OnSendMessage: return "OnSendMessage"
            case .OnTypingIndicator: return "OnTypingIndicator"
            case .OnAttributeChanged: return "OnAttributeChanged"
            case .OnPrivacyLevelChanged: return "OnPrivacyLevelChanged"
            case .OnInvitationAdded: return "OnInvitationAdded"
            case .OnInvitationRemoved: return "OnInvitationRemoved"
            case .OnSuggestionAdded: return "OnSuggestionAdded"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnMemberAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberAttributeChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberRoleChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSendMessage: return Bgs_Protocol_NO_RESPONSE.self
            case .OnTypingIndicator: return Bgs_Protocol_NO_RESPONSE.self
            case .OnAttributeChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnPrivacyLevelChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSuggestionAdded: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnMemberAdded: return Bgs_Protocol_Channel_V2_MemberAddedNotification.self
            case .OnMemberRemoved: return Bgs_Protocol_Channel_V2_MemberRemovedNotification.self
            case .OnMemberAttributeChanged: return Bgs_Protocol_Channel_V2_MemberAttributeChangedNotification.self
            case .OnMemberRoleChanged: return Bgs_Protocol_Channel_V2_MemberRoleChangedNotification.self
            case .OnSendMessage: return Bgs_Protocol_Channel_V2_SendMessageNotification.self
            case .OnTypingIndicator: return Bgs_Protocol_Channel_V2_TypingIndicatorNotification.self
            case .OnAttributeChanged: return Bgs_Protocol_Channel_V2_AttributeChangedNotification.self
            case .OnPrivacyLevelChanged: return Bgs_Protocol_Channel_V2_PrivacyLevelChangedNotification.self
            case .OnInvitationAdded: return Bgs_Protocol_Channel_V2_InvitationAddedNotification.self
            case .OnInvitationRemoved: return Bgs_Protocol_Channel_V2_InvitationRemovedNotification.self
            case .OnSuggestionAdded: return Bgs_Protocol_Channel_V2_SuggestionAddedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
