import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_V2_Membership_ChannelMembershipService: ServiceType {
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
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.v2.membership.ChannelMembershipService"

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

extension Bnet_Protocol_Channel_V2_Membership_ChannelMembershipService {
    func Subscribe(request: Bgs_Protocol_Channel_V2_Membership_SubscribeRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V2_Membership_SubscribeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func Unsubscribe(request: Bgs_Protocol_Channel_V2_Membership_UnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }

    func GetState(request: Bgs_Protocol_Channel_V2_Membership_GetStateRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V2_Membership_GetStateResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetState))
    }
}
