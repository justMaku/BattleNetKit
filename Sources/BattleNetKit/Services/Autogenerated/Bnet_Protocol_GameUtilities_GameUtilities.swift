import Foundation

class Bnet_Protocol_GameUtilities_GameUtilities: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.game_utilities.GameUtilities"

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
        case ProcessClientRequest = 1
        case PresenceChannelCreated = 2
        case GetPlayerVariables = 3
        case ProcessServerRequest = 6
        case OnGameAccountOnline = 7
        case OnGameAccountOffline = 8
        case GetAchievementsFile = 9
        case GetAllValuesForAttribute = 10
        case RegisterUtilities = 11
        case UnregisterUtilities = 12

        var name: String {
            switch self {
            case .ProcessClientRequest: return "ProcessClientRequest"
            case .PresenceChannelCreated: return "PresenceChannelCreated"
            case .GetPlayerVariables: return "GetPlayerVariables"
            case .ProcessServerRequest: return "ProcessServerRequest"
            case .OnGameAccountOnline: return "OnGameAccountOnline"
            case .OnGameAccountOffline: return "OnGameAccountOffline"
            case .GetAchievementsFile: return "GetAchievementsFile"
            case .GetAllValuesForAttribute: return "GetAllValuesForAttribute"
            case .RegisterUtilities: return "RegisterUtilities"
            case .UnregisterUtilities: return "UnregisterUtilities"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .ProcessClientRequest: return Bgs_Protocol_GameUtilities_V1_ClientResponse.self
            case .PresenceChannelCreated: return Bgs_Protocol_NoData.self
            case .GetPlayerVariables: return Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesResponse.self
            case .ProcessServerRequest: return Bgs_Protocol_GameUtilities_V1_ServerResponse.self
            case .OnGameAccountOnline: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountOffline: return Bgs_Protocol_NO_RESPONSE.self
            case .GetAchievementsFile: return Bgs_Protocol_GameUtilities_V1_GetAchievementsFileResponse.self
            case .GetAllValuesForAttribute: return Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeResponse.self
            case .RegisterUtilities: return Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesResponse.self
            case .UnregisterUtilities: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .ProcessClientRequest: return Bgs_Protocol_GameUtilities_V1_ClientRequest.self
            case .PresenceChannelCreated: return Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest.self
            case .GetPlayerVariables: return Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest.self
            case .ProcessServerRequest: return Bgs_Protocol_GameUtilities_V1_ServerRequest.self
            case .OnGameAccountOnline: return Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification.self
            case .OnGameAccountOffline: return Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification.self
            case .GetAchievementsFile: return Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest.self
            case .GetAllValuesForAttribute: return Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest.self
            case .RegisterUtilities: return Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest.self
            case .UnregisterUtilities: return Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
