import Foundation

class Bnet_Protocol_Account_AccountNotify: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.account.AccountNotify"

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
        case OnAccountStateUpdated = 1
        case OnGameAccountStateUpdated = 2
        case OnGameAccountsUpdated = 3
        case OnGameSessionUpdated = 4

        var name: String {
            switch self {
            case .OnAccountStateUpdated: return "OnAccountStateUpdated"
            case .OnGameAccountStateUpdated: return "OnGameAccountStateUpdated"
            case .OnGameAccountsUpdated: return "OnGameAccountsUpdated"
            case .OnGameSessionUpdated: return "OnGameSessionUpdated"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnAccountStateUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountStateUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountsUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameSessionUpdated: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnAccountStateUpdated: return Bgs_Protocol_Account_V1_AccountStateNotification.self
            case .OnGameAccountStateUpdated: return Bgs_Protocol_Account_V1_GameAccountStateNotification.self
            case .OnGameAccountsUpdated: return Bgs_Protocol_Account_V1_GameAccountNotification.self
            case .OnGameSessionUpdated: return Bgs_Protocol_Account_V1_GameAccountSessionNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
