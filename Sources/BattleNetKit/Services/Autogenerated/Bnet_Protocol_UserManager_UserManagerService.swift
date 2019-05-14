import Foundation

class Bnet_Protocol_UserManager_UserManagerService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.user_manager.UserManagerService"

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
            return UInt32(rawValue)
        }
    }
}
