import Foundation

class Bnet_Protocol_Channel_Channel: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.Channel"

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
        case RemoveMember = 2
        case SendMessage = 3
        case UpdateChannelState = 4
        case UpdateMemberState = 5
        case Dissolve = 6

        var name: String {
            switch self {
            case .RemoveMember: return "RemoveMember"
            case .SendMessage: return "SendMessage"
            case .UpdateChannelState: return "UpdateChannelState"
            case .UpdateMemberState: return "UpdateMemberState"
            case .Dissolve: return "Dissolve"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .RemoveMember: return Bgs_Protocol_NoData.self
            case .SendMessage: return Bgs_Protocol_NoData.self
            case .UpdateChannelState: return Bgs_Protocol_NoData.self
            case .UpdateMemberState: return Bgs_Protocol_NoData.self
            case .Dissolve: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .RemoveMember: return Bgs_Protocol_Channel_V1_RemoveMemberRequest.self
            case .SendMessage: return Bgs_Protocol_Channel_V1_SendMessageRequest.self
            case .UpdateChannelState: return Bgs_Protocol_Channel_V1_UpdateChannelStateRequest.self
            case .UpdateMemberState: return Bgs_Protocol_Channel_V1_UpdateMemberStateRequest.self
            case .Dissolve: return Bgs_Protocol_Channel_V1_DissolveRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
