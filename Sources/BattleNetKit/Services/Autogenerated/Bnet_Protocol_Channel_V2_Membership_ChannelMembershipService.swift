import Foundation

class Bnet_Protocol_Channel_V2_Membership_ChannelMembershipService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.v2.membership.ChannelMembershipService"

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

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .GetState: return "GetState"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Channel_V2_Membership_SubscribeResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .GetState: return Bgs_Protocol_Channel_V2_Membership_GetStateResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Channel_V2_Membership_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Channel_V2_Membership_UnsubscribeRequest.self
            case .GetState: return Bgs_Protocol_Channel_V2_Membership_GetStateRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
