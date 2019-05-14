import Foundation

class Bnet_Protocol_Authentication_AuthenticationServer: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.authentication.AuthenticationServer"

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
        case Logon = 1
        case ModuleNotify = 2
        case ModuleMessage = 3
        case SelectGameAccount_DEPRECATED = 4
        case GenerateSSOToken = 5
        case SelectGameAccount = 6
        case VerifyWebCredentials = 7
        case GenerateWebCredentials = 8

        var name: String {
            switch self {
            case .Logon: return "Logon"
            case .ModuleNotify: return "ModuleNotify"
            case .ModuleMessage: return "ModuleMessage"
            case .SelectGameAccount_DEPRECATED: return "SelectGameAccount_DEPRECATED"
            case .GenerateSSOToken: return "GenerateSSOToken"
            case .SelectGameAccount: return "SelectGameAccount"
            case .VerifyWebCredentials: return "VerifyWebCredentials"
            case .GenerateWebCredentials: return "GenerateWebCredentials"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Logon: return Bgs_Protocol_NoData.self
            case .ModuleNotify: return Bgs_Protocol_NoData.self
            case .ModuleMessage: return Bgs_Protocol_NoData.self
            case .SelectGameAccount_DEPRECATED: return Bgs_Protocol_NoData.self
            case .GenerateSSOToken: return Bgs_Protocol_Authentication_V1_GenerateSSOTokenResponse.self
            case .SelectGameAccount: return Bgs_Protocol_NoData.self
            case .VerifyWebCredentials: return Bgs_Protocol_NoData.self
            case .GenerateWebCredentials: return Bgs_Protocol_Authentication_V1_GenerateWebCredentialsResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Logon: return Bgs_Protocol_Authentication_V1_LogonRequest.self
            case .ModuleNotify: return Bgs_Protocol_Authentication_V1_ModuleNotification.self
            case .ModuleMessage: return Bgs_Protocol_Authentication_V1_ModuleMessageRequest.self
            case .SelectGameAccount_DEPRECATED: return Bgs_Protocol_EntityId.self
            case .GenerateSSOToken: return Bgs_Protocol_Authentication_V1_GenerateSSOTokenRequest.self
            case .SelectGameAccount: return Bgs_Protocol_Authentication_V1_SelectGameAccountRequest.self
            case .VerifyWebCredentials: return Bgs_Protocol_Authentication_V1_VerifyWebCredentialsRequest.self
            case .GenerateWebCredentials: return Bgs_Protocol_Authentication_V1_GenerateWebCredentialsRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
