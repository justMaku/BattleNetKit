import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_Channel: ServiceType {
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
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.Channel"

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

extension Bnet_Protocol_Channel_Channel {
    func RemoveMember(request: Bgs_Protocol_Channel_V1_RemoveMemberRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.RemoveMember))
    }

    func SendMessage(request: Bgs_Protocol_Channel_V1_SendMessageRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SendMessage))
    }

    func UpdateChannelState(request: Bgs_Protocol_Channel_V1_UpdateChannelStateRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.UpdateChannelState))
    }

    func UpdateMemberState(request: Bgs_Protocol_Channel_V1_UpdateMemberStateRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.UpdateMemberState))
    }

    func Dissolve(request: Bgs_Protocol_Channel_V1_DissolveRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Dissolve))
    }
}
