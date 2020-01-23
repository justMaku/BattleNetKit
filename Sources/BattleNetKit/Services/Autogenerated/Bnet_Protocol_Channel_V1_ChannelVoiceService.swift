import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_V1_ChannelVoiceService: ServiceType {
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
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.v1.ChannelVoiceService"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    init(eventLoop: EventLoop, messageQueue: AuroraMessageQueue) {
        self.eventLoop = eventLoop
        self.messageQueue = messageQueue
    }

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }
}

extension Bnet_Protocol_Channel_V1_ChannelVoiceService {
    func GetLoginToken(request: Bgs_Protocol_Channel_V1_GetLoginTokenRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V1_GetLoginTokenResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetLoginToken))
    }

    func GetJoinToken(request: Bgs_Protocol_Channel_V1_GetJoinTokenRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V1_GetJoinTokenResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetJoinToken))
    }
}
