import Foundation

class Bnet_Protocol_Channel_ChannelSubscriber: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.ChannelSubscriber"

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
        case OnJoin = 1
        case OnMemberAdded = 2
        case OnLeave = 3
        case OnMemberRemoved = 4
        case OnSendMessage = 5
        case OnUpdateChannelState = 6
        case OnUpdateMemberState = 7

        var name: String {
            switch self {
            case .OnJoin: return "OnJoin"
            case .OnMemberAdded: return "OnMemberAdded"
            case .OnLeave: return "OnLeave"
            case .OnMemberRemoved: return "OnMemberRemoved"
            case .OnSendMessage: return "OnSendMessage"
            case .OnUpdateChannelState: return "OnUpdateChannelState"
            case .OnUpdateMemberState: return "OnUpdateMemberState"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnJoin: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLeave: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSendMessage: return Bgs_Protocol_NO_RESPONSE.self
            case .OnUpdateChannelState: return Bgs_Protocol_NO_RESPONSE.self
            case .OnUpdateMemberState: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnJoin: return Bgs_Protocol_Channel_V1_JoinNotification.self
            case .OnMemberAdded: return Bgs_Protocol_Channel_V1_MemberAddedNotification.self
            case .OnLeave: return Bgs_Protocol_Channel_V1_LeaveNotification.self
            case .OnMemberRemoved: return Bgs_Protocol_Channel_V1_MemberRemovedNotification.self
            case .OnSendMessage: return Bgs_Protocol_Channel_V1_SendMessageNotification.self
            case .OnUpdateChannelState: return Bgs_Protocol_Channel_V1_UpdateChannelStateNotification.self
            case .OnUpdateMemberState: return Bgs_Protocol_Channel_V1_UpdateMemberStateNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
