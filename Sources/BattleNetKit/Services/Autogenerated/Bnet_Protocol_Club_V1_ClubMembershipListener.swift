import Foundation

class Bnet_Protocol_Club_V1_ClubMembershipListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.club.v1.ClubMembershipListener"

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
        case OnClubAdded = 1
        case OnClubRemoved = 2
        case OnReceivedInvitationAdded = 3
        case OnReceivedInvitationRemoved = 4
        case OnSharedSettingsChanged = 5
        case OnStreamMentionAdded = 6
        case OnStreamMentionRemoved = 7
        case OnStreamMentionAdvanceViewTime = 8

        var name: String {
            switch self {
            case .OnClubAdded: return "OnClubAdded"
            case .OnClubRemoved: return "OnClubRemoved"
            case .OnReceivedInvitationAdded: return "OnReceivedInvitationAdded"
            case .OnReceivedInvitationRemoved: return "OnReceivedInvitationRemoved"
            case .OnSharedSettingsChanged: return "OnSharedSettingsChanged"
            case .OnStreamMentionAdded: return "OnStreamMentionAdded"
            case .OnStreamMentionRemoved: return "OnStreamMentionRemoved"
            case .OnStreamMentionAdvanceViewTime: return "OnStreamMentionAdvanceViewTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnClubAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnClubRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSharedSettingsChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStreamMentionAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStreamMentionRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStreamMentionAdvanceViewTime: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnClubAdded: return Bgs_Protocol_Club_V1_Membership_ClubAddedNotification.self
            case .OnClubRemoved: return Bgs_Protocol_Club_V1_Membership_ClubRemovedNotification.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_Club_V1_Membership_ReceivedInvitationAddedNotification.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_Club_V1_Membership_ReceivedInvitationRemovedNotification.self
            case .OnSharedSettingsChanged: return Bgs_Protocol_Club_V1_Membership_SharedSettingsChangedNotification.self
            case .OnStreamMentionAdded: return Bgs_Protocol_Club_V1_Membership_StreamMentionAddedNotification.self
            case .OnStreamMentionRemoved: return Bgs_Protocol_Club_V1_Membership_StreamMentionRemovedNotification.self
            case .OnStreamMentionAdvanceViewTime: return Bgs_Protocol_Club_V1_Membership_StreamMentionAdvanceViewTimeNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
