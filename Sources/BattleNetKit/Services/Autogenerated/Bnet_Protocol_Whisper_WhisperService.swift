import Foundation

class Bnet_Protocol_Whisper_WhisperService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.whisper.WhisperService"

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
            return UInt32(rawValue)
        }
    }
}
