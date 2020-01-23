import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Club_V1_ClubMembershipService: ServiceType {
    enum Method: Int, MethodType {
        case Subscribe = 1
        case Unsubscribe = 2
        case GetState = 3
        case UpdateClubSharedSettings = 4
        case GetStreamMentions = 5
        case RemoveStreamMentions = 6
        case AdvanceStreamMentionViewTime = 7

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .GetState: return "GetState"
            case .UpdateClubSharedSettings: return "UpdateClubSharedSettings"
            case .GetStreamMentions: return "GetStreamMentions"
            case .RemoveStreamMentions: return "RemoveStreamMentions"
            case .AdvanceStreamMentionViewTime: return "AdvanceStreamMentionViewTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Club_V1_Membership_SubscribeResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .GetState: return Bgs_Protocol_Club_V1_Membership_GetStateResponse.self
            case .UpdateClubSharedSettings: return Bgs_Protocol_NoData.self
            case .GetStreamMentions: return Bgs_Protocol_Club_V1_Membership_GetStreamMentionsResponse.self
            case .RemoveStreamMentions: return Bgs_Protocol_NoData.self
            case .AdvanceStreamMentionViewTime: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Club_V1_Membership_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Club_V1_Membership_UnsubscribeRequest.self
            case .GetState: return Bgs_Protocol_Club_V1_Membership_GetStateRequest.self
            case .UpdateClubSharedSettings: return Bgs_Protocol_Club_V1_Membership_UpdateClubSharedSettingsRequest.self
            case .GetStreamMentions: return Bgs_Protocol_Club_V1_Membership_GetStreamMentionsRequest.self
            case .RemoveStreamMentions: return Bgs_Protocol_Club_V1_Membership_RemoveStreamMentionsRequest.self
            case .AdvanceStreamMentionViewTime: return Bgs_Protocol_Club_V1_Membership_AdvanceStreamMentionViewTimeRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.club.v1.ClubMembershipService"

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

extension Bnet_Protocol_Club_V1_ClubMembershipService {
    func Subscribe(request: Bgs_Protocol_Club_V1_Membership_SubscribeRequest) -> EventLoopFuture<Bgs_Protocol_Club_V1_Membership_SubscribeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func Unsubscribe(request: Bgs_Protocol_Club_V1_Membership_UnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }

    func GetState(request: Bgs_Protocol_Club_V1_Membership_GetStateRequest) -> EventLoopFuture<Bgs_Protocol_Club_V1_Membership_GetStateResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetState))
    }

    func UpdateClubSharedSettings(request: Bgs_Protocol_Club_V1_Membership_UpdateClubSharedSettingsRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.UpdateClubSharedSettings))
    }

    func GetStreamMentions(request: Bgs_Protocol_Club_V1_Membership_GetStreamMentionsRequest) -> EventLoopFuture<Bgs_Protocol_Club_V1_Membership_GetStreamMentionsResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetStreamMentions))
    }

    func RemoveStreamMentions(request: Bgs_Protocol_Club_V1_Membership_RemoveStreamMentionsRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.RemoveStreamMentions))
    }

    func AdvanceStreamMentionViewTime(request: Bgs_Protocol_Club_V1_Membership_AdvanceStreamMentionViewTimeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.AdvanceStreamMentionViewTime))
    }
}
