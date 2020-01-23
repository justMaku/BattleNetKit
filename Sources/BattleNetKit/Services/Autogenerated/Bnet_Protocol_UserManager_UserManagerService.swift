import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_UserManager_UserManagerService: ServiceType {
    enum Method: Int, MethodType {
        case Subscribe = 1
        case AddRecentPlayers = 10
        case ClearRecentPlayers = 11
        case BlockPlayer = 20
        case UnblockPlayer = 21
        case BlockPlayerForSession = 40
        case Unsubscribe = 51

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .AddRecentPlayers: return "AddRecentPlayers"
            case .ClearRecentPlayers: return "ClearRecentPlayers"
            case .BlockPlayer: return "BlockPlayer"
            case .UnblockPlayer: return "UnblockPlayer"
            case .BlockPlayerForSession: return "BlockPlayerForSession"
            case .Unsubscribe: return "Unsubscribe"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_UserManager_V1_SubscribeResponse.self
            case .AddRecentPlayers: return Bgs_Protocol_NoData.self
            case .ClearRecentPlayers: return Bgs_Protocol_NoData.self
            case .BlockPlayer: return Bgs_Protocol_NoData.self
            case .UnblockPlayer: return Bgs_Protocol_NoData.self
            case .BlockPlayerForSession: return Bgs_Protocol_NoData.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_UserManager_V1_SubscribeRequest.self
            case .AddRecentPlayers: return Bgs_Protocol_UserManager_V1_AddRecentPlayersRequest.self
            case .ClearRecentPlayers: return Bgs_Protocol_UserManager_V1_ClearRecentPlayersRequest.self
            case .BlockPlayer: return Bgs_Protocol_UserManager_V1_BlockPlayerRequest.self
            case .UnblockPlayer: return Bgs_Protocol_UserManager_V1_UnblockPlayerRequest.self
            case .BlockPlayerForSession: return Bgs_Protocol_UserManager_V1_BlockPlayerRequest.self
            case .Unsubscribe: return Bgs_Protocol_UserManager_V1_UnsubscribeRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.user_manager.UserManagerService"

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

extension Bnet_Protocol_UserManager_UserManagerService {
    func Subscribe(request: Bgs_Protocol_UserManager_V1_SubscribeRequest) -> EventLoopFuture<Bgs_Protocol_UserManager_V1_SubscribeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func AddRecentPlayers(request: Bgs_Protocol_UserManager_V1_AddRecentPlayersRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.AddRecentPlayers))
    }

    func ClearRecentPlayers(request: Bgs_Protocol_UserManager_V1_ClearRecentPlayersRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ClearRecentPlayers))
    }

    func BlockPlayer(request: Bgs_Protocol_UserManager_V1_BlockPlayerRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.BlockPlayer))
    }

    func UnblockPlayer(request: Bgs_Protocol_UserManager_V1_UnblockPlayerRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.UnblockPlayer))
    }

    func BlockPlayerForSession(request: Bgs_Protocol_UserManager_V1_BlockPlayerRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.BlockPlayerForSession))
    }

    func Unsubscribe(request: Bgs_Protocol_UserManager_V1_UnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }
}
