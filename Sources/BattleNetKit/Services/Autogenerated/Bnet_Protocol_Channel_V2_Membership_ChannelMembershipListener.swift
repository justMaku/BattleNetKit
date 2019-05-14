import Foundation

class Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.v2.membership.ChannelMembershipListener"

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
        case OnChannelAdded = 1
        case OnChannelRemoved = 2
        case OnReceivedInvitationAdded = 3
        case OnReceivedInvitationRemoved = 4

        var name: String {
            switch self {
            case .OnChannelAdded: return "OnChannelAdded"
            case .OnChannelRemoved: return "OnChannelRemoved"
            case .OnReceivedInvitationAdded: return "OnReceivedInvitationAdded"
            case .OnReceivedInvitationRemoved: return "OnReceivedInvitationRemoved"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnChannelAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnChannelRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnChannelAdded: return Bgs_Protocol_Channel_V2_Membership_ChannelAddedNotification.self
            case .OnChannelRemoved: return Bgs_Protocol_Channel_V2_Membership_ChannelRemovedNotification.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationAddedNotification.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationRemovedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
