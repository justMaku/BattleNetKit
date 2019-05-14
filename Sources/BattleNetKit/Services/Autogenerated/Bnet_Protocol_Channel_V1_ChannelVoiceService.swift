import Foundation

class Bnet_Protocol_Channel_V1_ChannelVoiceService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.channel.v1.ChannelVoiceService"

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
        case GetLoginToken = 1
        case GetJoinToken = 2

        var name: String {
            switch self {
            case .GetLoginToken: return "GetLoginToken"
            case .GetJoinToken: return "GetJoinToken"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .GetLoginToken: return Bgs_Protocol_Channel_V1_GetLoginTokenResponse.self
            case .GetJoinToken: return Bgs_Protocol_Channel_V1_GetJoinTokenResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .GetLoginToken: return Bgs_Protocol_Channel_V1_GetLoginTokenRequest.self
            case .GetJoinToken: return Bgs_Protocol_Channel_V1_GetJoinTokenRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
