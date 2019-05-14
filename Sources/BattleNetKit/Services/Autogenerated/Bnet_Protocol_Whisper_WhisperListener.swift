import Foundation

class Bnet_Protocol_Whisper_WhisperListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.whisper.WhisperListener"

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
        case OnWhisper = 1
        case OnWhisperEcho = 2
        case OnTypingIndicatorUpdate = 3
        case OnAdvanceViewTime = 4
        case OnWhisperUpdated = 5
        case OnAdvanceClearTime = 6

        var name: String {
            switch self {
            case .OnWhisper: return "OnWhisper"
            case .OnWhisperEcho: return "OnWhisperEcho"
            case .OnTypingIndicatorUpdate: return "OnTypingIndicatorUpdate"
            case .OnAdvanceViewTime: return "OnAdvanceViewTime"
            case .OnWhisperUpdated: return "OnWhisperUpdated"
            case .OnAdvanceClearTime: return "OnAdvanceClearTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnWhisper: return Bgs_Protocol_NO_RESPONSE.self
            case .OnWhisperEcho: return Bgs_Protocol_NO_RESPONSE.self
            case .OnTypingIndicatorUpdate: return Bgs_Protocol_NO_RESPONSE.self
            case .OnAdvanceViewTime: return Bgs_Protocol_NO_RESPONSE.self
            case .OnWhisperUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnAdvanceClearTime: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnWhisper: return Bgs_Protocol_Whisper_V1_WhisperNotification.self
            case .OnWhisperEcho: return Bgs_Protocol_Whisper_V1_WhisperEchoNotification.self
            case .OnTypingIndicatorUpdate: return Bgs_Protocol_Whisper_V1_TypingIndicatorNotification.self
            case .OnAdvanceViewTime: return Bgs_Protocol_Whisper_V1_AdvanceViewTimeNotification.self
            case .OnWhisperUpdated: return Bgs_Protocol_Whisper_V1_WhisperUpdatedNotification.self
            case .OnAdvanceClearTime: return Bgs_Protocol_Whisper_V1_AdvanceClearTimeNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
