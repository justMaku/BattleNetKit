import Foundation

class Bnet_Protocol_Presence_V1_PresenceListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.presence.v1.PresenceListener"

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
        case OnSubscribe = 1
        case OnStateChanged = 2

        var name: String {
            switch self {
            case .OnSubscribe: return "OnSubscribe"
            case .OnStateChanged: return "OnStateChanged"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnSubscribe: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStateChanged: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnSubscribe: return Bgs_Protocol_Presence_V1_SubscribeNotification.self
            case .OnStateChanged: return Bgs_Protocol_Presence_V1_StateChangedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
