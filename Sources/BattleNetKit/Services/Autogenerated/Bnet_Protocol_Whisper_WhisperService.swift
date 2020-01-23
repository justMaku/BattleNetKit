import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Whisper_WhisperService: ServiceType {
    enum Method: Int, MethodType {
        case Subscribe = 1
        case Unsubscribe = 2
        case SendWhisper = 3
        case SetTypingIndicator = 4
        case AdvanceViewTime = 5
        case GetWhisperMessages = 6
        case AdvanceClearTime = 7

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .SendWhisper: return "SendWhisper"
            case .SetTypingIndicator: return "SetTypingIndicator"
            case .AdvanceViewTime: return "AdvanceViewTime"
            case .GetWhisperMessages: return "GetWhisperMessages"
            case .AdvanceClearTime: return "AdvanceClearTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Whisper_V1_SubscribeResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .SendWhisper: return Bgs_Protocol_Whisper_V1_SendWhisperResponse.self
            case .SetTypingIndicator: return Bgs_Protocol_NoData.self
            case .AdvanceViewTime: return Bgs_Protocol_NoData.self
            case .GetWhisperMessages: return Bgs_Protocol_Whisper_V1_GetWhisperMessagesResponse.self
            case .AdvanceClearTime: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Whisper_V1_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Whisper_V1_UnsubscribeRequest.self
            case .SendWhisper: return Bgs_Protocol_Whisper_V1_SendWhisperRequest.self
            case .SetTypingIndicator: return Bgs_Protocol_Whisper_V1_SetTypingIndicatorRequest.self
            case .AdvanceViewTime: return Bgs_Protocol_Whisper_V1_AdvanceViewTimeRequest.self
            case .GetWhisperMessages: return Bgs_Protocol_Whisper_V1_GetWhisperMessagesRequest.self
            case .AdvanceClearTime: return Bgs_Protocol_Whisper_V1_AdvanceClearTimeRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.whisper.WhisperService"

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

extension Bnet_Protocol_Whisper_WhisperService {
    func Subscribe(request: Bgs_Protocol_Whisper_V1_SubscribeRequest) -> EventLoopFuture<Bgs_Protocol_Whisper_V1_SubscribeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func Unsubscribe(request: Bgs_Protocol_Whisper_V1_UnsubscribeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }

    func SendWhisper(request: Bgs_Protocol_Whisper_V1_SendWhisperRequest) -> EventLoopFuture<Bgs_Protocol_Whisper_V1_SendWhisperResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SendWhisper))
    }

    func SetTypingIndicator(request: Bgs_Protocol_Whisper_V1_SetTypingIndicatorRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SetTypingIndicator))
    }

    func AdvanceViewTime(request: Bgs_Protocol_Whisper_V1_AdvanceViewTimeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.AdvanceViewTime))
    }

    func GetWhisperMessages(request: Bgs_Protocol_Whisper_V1_GetWhisperMessagesRequest) -> EventLoopFuture<Bgs_Protocol_Whisper_V1_GetWhisperMessagesResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetWhisperMessages))
    }

    func AdvanceClearTime(request: Bgs_Protocol_Whisper_V1_AdvanceClearTimeRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.AdvanceClearTime))
    }
}
