import Foundation

class Bnet_Protocol_Sns_SocialNetworkService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.sns.SocialNetworkService"

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
        case GetFacebookAuthCode = 1
        case GetFacebookBnetFriends = 2
        case GetFacebookSettings = 3
        case GetFacebookAccountLinkStatus = 4
        case GetGoogleAuthToken = 5
        case GetGoogleSettings = 6
        case GetGoogleAccountLinkStatus = 7

        var name: String {
            switch self {
            case .GetFacebookAuthCode: return "GetFacebookAuthCode"
            case .GetFacebookBnetFriends: return "GetFacebookBnetFriends"
            case .GetFacebookSettings: return "GetFacebookSettings"
            case .GetFacebookAccountLinkStatus: return "GetFacebookAccountLinkStatus"
            case .GetGoogleAuthToken: return "GetGoogleAuthToken"
            case .GetGoogleSettings: return "GetGoogleSettings"
            case .GetGoogleAccountLinkStatus: return "GetGoogleAccountLinkStatus"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .GetFacebookAuthCode: return Bgs_Protocol_Sns_V1_GetFacebookAuthCodeResponse.self
            case .GetFacebookBnetFriends: return Bgs_Protocol_NoData.self
            case .GetFacebookSettings: return Bgs_Protocol_Sns_V1_GetFacebookSettingsResponse.self
            case .GetFacebookAccountLinkStatus: return Bgs_Protocol_Sns_V1_GetFacebookAccountLinkStatusResponse.self
            case .GetGoogleAuthToken: return Bgs_Protocol_Sns_V1_GetGoogleAuthTokenResponse.self
            case .GetGoogleSettings: return Bgs_Protocol_Sns_V1_GetGoogleSettingsResponse.self
            case .GetGoogleAccountLinkStatus: return Bgs_Protocol_Sns_V1_GetGoogleAccountLinkStatusResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .GetFacebookAuthCode: return Bgs_Protocol_Sns_V1_GetFacebookAuthCodeRequest.self
            case .GetFacebookBnetFriends: return Bgs_Protocol_Sns_V1_GetFacebookBnetFriendsRequest.self
            case .GetFacebookSettings: return Bgs_Protocol_NoData.self
            case .GetFacebookAccountLinkStatus: return Bgs_Protocol_Sns_V1_GetFacebookAccountLinkStatusRequest.self
            case .GetGoogleAuthToken: return Bgs_Protocol_Sns_V1_GetGoogleAuthTokenRequest.self
            case .GetGoogleSettings: return Bgs_Protocol_NoData.self
            case .GetGoogleAccountLinkStatus: return Bgs_Protocol_Sns_V1_GetGoogleAccountLinkStatusRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
