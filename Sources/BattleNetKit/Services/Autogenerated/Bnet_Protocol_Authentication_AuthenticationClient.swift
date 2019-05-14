import Foundation

class Bnet_Protocol_Authentication_AuthenticationClient: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.authentication.AuthenticationClient"

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
        case OnModuleLoad = 1
        case OnModuleMessage = 2
        case OnServerStateChange = 4
        case OnLogonComplete = 5
        case OnMemModuleLoad = 6
        case OnLogonUpdate = 10
        case OnVersionInfoUpdated = 11
        case OnLogonQueueUpdate = 12
        case OnLogonQueueEnd = 13
        case OnGameAccountSelected = 14

        var name: String {
            switch self {
            case .OnModuleLoad: return "OnModuleLoad"
            case .OnModuleMessage: return "OnModuleMessage"
            case .OnServerStateChange: return "OnServerStateChange"
            case .OnLogonComplete: return "OnLogonComplete"
            case .OnMemModuleLoad: return "OnMemModuleLoad"
            case .OnLogonUpdate: return "OnLogonUpdate"
            case .OnVersionInfoUpdated: return "OnVersionInfoUpdated"
            case .OnLogonQueueUpdate: return "OnLogonQueueUpdate"
            case .OnLogonQueueEnd: return "OnLogonQueueEnd"
            case .OnGameAccountSelected: return "OnGameAccountSelected"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnModuleLoad: return Bgs_Protocol_NO_RESPONSE.self
            case .OnModuleMessage: return Bgs_Protocol_NoData.self
            case .OnServerStateChange: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLogonComplete: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemModuleLoad: return Bgs_Protocol_Authentication_V1_MemModuleLoadResponse.self
            case .OnLogonUpdate: return Bgs_Protocol_NO_RESPONSE.self
            case .OnVersionInfoUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLogonQueueUpdate: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLogonQueueEnd: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountSelected: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnModuleLoad: return Bgs_Protocol_Authentication_V1_ModuleLoadRequest.self
            case .OnModuleMessage: return Bgs_Protocol_Authentication_V1_ModuleMessageRequest.self
            case .OnServerStateChange: return Bgs_Protocol_Authentication_V1_ServerStateChangeRequest.self
            case .OnLogonComplete: return Bgs_Protocol_Authentication_V1_LogonResult.self
            case .OnMemModuleLoad: return Bgs_Protocol_Authentication_V1_MemModuleLoadRequest.self
            case .OnLogonUpdate: return Bgs_Protocol_Authentication_V1_LogonUpdateRequest.self
            case .OnVersionInfoUpdated: return Bgs_Protocol_Authentication_V1_VersionInfoNotification.self
            case .OnLogonQueueUpdate: return Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest.self
            case .OnLogonQueueEnd: return Bgs_Protocol_NoData.self
            case .OnGameAccountSelected: return Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
