import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Presence_PresenceService: ServiceType {
    enum Method: Int, MethodType {
        case Subscribe = 1
        case Unsubscribe = 2
        case Update = 3
        case Query = 4
        case Ownership = 5
        case SubscribeNotification = 7
        case BatchSubscribe = 8
        case BatchUnsubscribe = 9

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .Update: return "Update"
            case .Query: return "Query"
            case .Ownership: return "Ownership"
            case .SubscribeNotification: return "SubscribeNotification"
            case .BatchSubscribe: return "BatchSubscribe"
            case .BatchUnsubscribe: return "BatchUnsubscribe"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_NoData.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .Update: return Bgs_Protocol_NoData.self
            case .Query: return Bgs_Protocol_Presence_V1_QueryResponse.self
            case .Ownership: return Bgs_Protocol_NoData.self
            case .SubscribeNotification: return Bgs_Protocol_NoData.self
            case .BatchSubscribe: return Bgs_Protocol_Presence_V1_BatchSubscribeResponse.self
            case .BatchUnsubscribe: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Presence_V1_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Presence_V1_UnsubscribeRequest.self
            case .Update: return Bgs_Protocol_Presence_V1_UpdateRequest.self
            case .Query: return Bgs_Protocol_Presence_V1_QueryRequest.self
            case .Ownership: return Bgs_Protocol_Presence_V1_OwnershipRequest.self
            case .SubscribeNotification: return Bgs_Protocol_Presence_V1_SubscribeNotificationRequest.self
            case .BatchSubscribe: return Bgs_Protocol_Presence_V1_BatchSubscribeRequest.self
            case .BatchUnsubscribe: return Bgs_Protocol_Presence_V1_BatchUnsubscribeRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.presence.PresenceService"

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

extension Bnet_Protocol_Presence_PresenceService {
    func Subscribe(request: Bgs_Protocol_Presence_V1_SubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func Unsubscribe(request: Bgs_Protocol_Presence_V1_UnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }

    func Update(request: Bgs_Protocol_Presence_V1_UpdateRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Update))
    }

    func Query(request: Bgs_Protocol_Presence_V1_QueryRequest) -> EventLoopFuture<Bgs_Protocol_Presence_V1_QueryResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Query))
    }

    func Ownership(request: Bgs_Protocol_Presence_V1_OwnershipRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Ownership))
    }

    func SubscribeNotification(request: Bgs_Protocol_Presence_V1_SubscribeNotificationRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SubscribeNotification))
    }

    func BatchSubscribe(request: Bgs_Protocol_Presence_V1_BatchSubscribeRequest) -> EventLoopFuture<Bgs_Protocol_Presence_V1_BatchSubscribeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.BatchSubscribe))
    }

    func BatchUnsubscribe(request: Bgs_Protocol_Presence_V1_BatchUnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.BatchUnsubscribe))
    }
}
