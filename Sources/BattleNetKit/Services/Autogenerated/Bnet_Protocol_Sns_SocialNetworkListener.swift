import Foundation

class Bnet_Protocol_Sns_SocialNetworkListener: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.sns.SocialNetworkListener"

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
        case OnFacebookBnetFriendListReceived = 1

        var name: String {
            switch self {
            case .OnFacebookBnetFriendListReceived: return "OnFacebookBnetFriendListReceived"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnFacebookBnetFriendListReceived: return Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotificationResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnFacebookBnetFriendListReceived: return Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
