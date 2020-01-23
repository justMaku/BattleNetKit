import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_V2_ChannelService: ServiceType {
    enum Method: Int, MethodType {
        case CreateChannel = 2
        case DissolveChannel = 3
        case GetChannel = 4
        case GetPublicChannelTypes = 5
        case FindChannel = 6
        case Subscribe = 10
        case Unsubscribe = 11
        case SetAttribute = 21
        case SetPrivacyLevel = 22
        case SendMessage = 23
        case SetTypingIndicator = 24
        case Join = 30
        case Leave = 31
        case Kick = 32
        case SetMemberAttribute = 40
        case AssignRole = 41
        case UnassignRole = 42
        case SendInvitation = 50
        case AcceptInvitation = 51
        case DeclineInvitation = 52
        case RevokeInvitation = 53
        case SendSuggestion = 60
        case GetJoinVoiceToken = 70

        var name: String {
            switch self {
            case .CreateChannel: return "CreateChannel"
            case .DissolveChannel: return "DissolveChannel"
            case .GetChannel: return "GetChannel"
            case .GetPublicChannelTypes: return "GetPublicChannelTypes"
            case .FindChannel: return "FindChannel"
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .SetAttribute: return "SetAttribute"
            case .SetPrivacyLevel: return "SetPrivacyLevel"
            case .SendMessage: return "SendMessage"
            case .SetTypingIndicator: return "SetTypingIndicator"
            case .Join: return "Join"
            case .Leave: return "Leave"
            case .Kick: return "Kick"
            case .SetMemberAttribute: return "SetMemberAttribute"
            case .AssignRole: return "AssignRole"
            case .UnassignRole: return "UnassignRole"
            case .SendInvitation: return "SendInvitation"
            case .AcceptInvitation: return "AcceptInvitation"
            case .DeclineInvitation: return "DeclineInvitation"
            case .RevokeInvitation: return "RevokeInvitation"
            case .SendSuggestion: return "SendSuggestion"
            case .GetJoinVoiceToken: return "GetJoinVoiceToken"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .CreateChannel: return Bgs_Protocol_NoData.self
            case .DissolveChannel: return Bgs_Protocol_NoData.self
            case .GetChannel: return Bgs_Protocol_Channel_V2_GetChannelResponse.self
            case .GetPublicChannelTypes: return Bgs_Protocol_Channel_V2_GetPublicChannelTypesResponse.self
            case .FindChannel: return Bgs_Protocol_NoData.self
            case .Subscribe: return Bgs_Protocol_Channel_V2_SubscribeResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .SetAttribute: return Bgs_Protocol_NoData.self
            case .SetPrivacyLevel: return Bgs_Protocol_NoData.self
            case .SendMessage: return Bgs_Protocol_NoData.self
            case .SetTypingIndicator: return Bgs_Protocol_NoData.self
            case .Join: return Bgs_Protocol_NoData.self
            case .Leave: return Bgs_Protocol_NoData.self
            case .Kick: return Bgs_Protocol_NoData.self
            case .SetMemberAttribute: return Bgs_Protocol_NoData.self
            case .AssignRole: return Bgs_Protocol_NoData.self
            case .UnassignRole: return Bgs_Protocol_NoData.self
            case .SendInvitation: return Bgs_Protocol_NoData.self
            case .AcceptInvitation: return Bgs_Protocol_NoData.self
            case .DeclineInvitation: return Bgs_Protocol_NoData.self
            case .RevokeInvitation: return Bgs_Protocol_NoData.self
            case .SendSuggestion: return Bgs_Protocol_NoData.self
            case .GetJoinVoiceToken: return Bgs_Protocol_Channel_V2_GetJoinVoiceTokenResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .CreateChannel: return Bgs_Protocol_Channel_V2_CreateChannelRequest.self
            case .DissolveChannel: return Bgs_Protocol_Channel_V2_DissolveChannelRequest.self
            case .GetChannel: return Bgs_Protocol_Channel_V2_GetChannelRequest.self
            case .GetPublicChannelTypes: return Bgs_Protocol_Channel_V2_GetPublicChannelTypesRequest.self
            case .FindChannel: return Bgs_Protocol_Channel_V2_FindChannelRequest.self
            case .Subscribe: return Bgs_Protocol_Channel_V2_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Channel_V2_UnsubscribeRequest.self
            case .SetAttribute: return Bgs_Protocol_Channel_V2_SetAttributeRequest.self
            case .SetPrivacyLevel: return Bgs_Protocol_Channel_V2_SetPrivacyLevelRequest.self
            case .SendMessage: return Bgs_Protocol_Channel_V2_SendMessageRequest.self
            case .SetTypingIndicator: return Bgs_Protocol_Channel_V2_SetTypingIndicatorRequest.self
            case .Join: return Bgs_Protocol_Channel_V2_JoinRequest.self
            case .Leave: return Bgs_Protocol_Channel_V2_LeaveRequest.self
            case .Kick: return Bgs_Protocol_Channel_V2_KickRequest.self
            case .SetMemberAttribute: return Bgs_Protocol_Channel_V2_SetMemberAttributeRequest.self
            case .AssignRole: return Bgs_Protocol_Channel_V2_AssignRoleRequest.self
            case .UnassignRole: return Bgs_Protocol_Channel_V2_UnassignRoleRequest.self
            case .SendInvitation: return Bgs_Protocol_Channel_V2_SendInvitationRequest.self
            case .AcceptInvitation: return Bgs_Protocol_Channel_V2_AcceptInvitationRequest.self
            case .DeclineInvitation: return Bgs_Protocol_Channel_V2_DeclineInvitationRequest.self
            case .RevokeInvitation: return Bgs_Protocol_Channel_V2_RevokeInvitationRequest.self
            case .SendSuggestion: return Bgs_Protocol_Channel_V2_SendSuggestionRequest.self
            case .GetJoinVoiceToken: return Bgs_Protocol_Channel_V2_GetJoinVoiceTokenRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.v2.ChannelService"

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

extension Bnet_Protocol_Channel_V2_ChannelService {
    func CreateChannel(request: Bgs_Protocol_Channel_V2_CreateChannelRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.CreateChannel))
    }

    func DissolveChannel(request: Bgs_Protocol_Channel_V2_DissolveChannelRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.DissolveChannel))
    }

    func GetChannel(request: Bgs_Protocol_Channel_V2_GetChannelRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V2_GetChannelResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetChannel))
    }

    func GetPublicChannelTypes(request: Bgs_Protocol_Channel_V2_GetPublicChannelTypesRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V2_GetPublicChannelTypesResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetPublicChannelTypes))
    }

    func FindChannel(request: Bgs_Protocol_Channel_V2_FindChannelRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.FindChannel))
    }

    func Subscribe(request: Bgs_Protocol_Channel_V2_SubscribeRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V2_SubscribeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func Unsubscribe(request: Bgs_Protocol_Channel_V2_UnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }

    func SetAttribute(request: Bgs_Protocol_Channel_V2_SetAttributeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SetAttribute))
    }

    func SetPrivacyLevel(request: Bgs_Protocol_Channel_V2_SetPrivacyLevelRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SetPrivacyLevel))
    }

    func SendMessage(request: Bgs_Protocol_Channel_V2_SendMessageRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SendMessage))
    }

    func SetTypingIndicator(request: Bgs_Protocol_Channel_V2_SetTypingIndicatorRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SetTypingIndicator))
    }

    func Join(request: Bgs_Protocol_Channel_V2_JoinRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Join))
    }

    func Leave(request: Bgs_Protocol_Channel_V2_LeaveRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Leave))
    }

    func Kick(request: Bgs_Protocol_Channel_V2_KickRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Kick))
    }

    func SetMemberAttribute(request: Bgs_Protocol_Channel_V2_SetMemberAttributeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SetMemberAttribute))
    }

    func AssignRole(request: Bgs_Protocol_Channel_V2_AssignRoleRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.AssignRole))
    }

    func UnassignRole(request: Bgs_Protocol_Channel_V2_UnassignRoleRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.UnassignRole))
    }

    func SendInvitation(request: Bgs_Protocol_Channel_V2_SendInvitationRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SendInvitation))
    }

    func AcceptInvitation(request: Bgs_Protocol_Channel_V2_AcceptInvitationRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.AcceptInvitation))
    }

    func DeclineInvitation(request: Bgs_Protocol_Channel_V2_DeclineInvitationRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.DeclineInvitation))
    }

    func RevokeInvitation(request: Bgs_Protocol_Channel_V2_RevokeInvitationRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.RevokeInvitation))
    }

    func SendSuggestion(request: Bgs_Protocol_Channel_V2_SendSuggestionRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SendSuggestion))
    }

    func GetJoinVoiceToken(request: Bgs_Protocol_Channel_V2_GetJoinVoiceTokenRequest) -> EventLoopFuture<Bgs_Protocol_Channel_V2_GetJoinVoiceTokenResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetJoinVoiceToken))
    }
}
