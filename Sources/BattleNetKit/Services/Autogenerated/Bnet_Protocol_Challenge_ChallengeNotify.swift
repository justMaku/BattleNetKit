import Foundation

class Bnet_Protocol_Challenge_ChallengeNotify: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.challenge.ChallengeNotify"

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
        case OnExternalChallenge = 3
        case OnExternalChallengeResult = 4

        var name: String {
            switch self {
            case .OnExternalChallenge: return "OnExternalChallenge"
            case .OnExternalChallengeResult: return "OnExternalChallengeResult"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnExternalChallenge: return Bgs_Protocol_NO_RESPONSE.self
            case .OnExternalChallengeResult: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnExternalChallenge: return Bgs_Protocol_Challenge_V1_ChallengeExternalRequest.self
            case .OnExternalChallengeResult: return Bgs_Protocol_Challenge_V1_ChallengeExternalResult.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
