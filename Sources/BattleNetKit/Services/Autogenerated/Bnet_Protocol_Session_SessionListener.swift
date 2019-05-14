import Foundation

class Bnet_Protocol_Session_SessionListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.session.SessionListener"

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
        case OnSessionCreated = 1
        case OnSessionDestroyed = 2
        case OnSessionUpdated = 3

        var name: String {
            switch self {
            case .OnSessionCreated: return "OnSessionCreated"
            case .OnSessionDestroyed: return "OnSessionDestroyed"
            case .OnSessionUpdated: return "OnSessionUpdated"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnSessionCreated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSessionDestroyed: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSessionUpdated: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnSessionCreated: return Bgs_Protocol_Session_V1_SessionCreatedNotification.self
            case .OnSessionDestroyed: return Bgs_Protocol_Session_V1_SessionDestroyedNotification.self
            case .OnSessionUpdated: return Bgs_Protocol_Session_V1_SessionUpdatedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
