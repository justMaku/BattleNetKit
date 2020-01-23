import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Sns_SocialNetworkService: ServiceType {
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
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.sns.SocialNetworkService"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    init(eventLoop: EventLoop, messageQueue: AuroraMessageQueue) {
        self.eventLoop = eventLoop
        self.messageQueue = messageQueue
    }

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }
}

extension Bnet_Protocol_Sns_SocialNetworkService {
    func GetFacebookAuthCode(request: Bgs_Protocol_Sns_V1_GetFacebookAuthCodeRequest) -> EventLoopFuture<Bgs_Protocol_Sns_V1_GetFacebookAuthCodeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetFacebookAuthCode))
    }

    func GetFacebookBnetFriends(request: Bgs_Protocol_Sns_V1_GetFacebookBnetFriendsRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetFacebookBnetFriends))
    }

    func GetFacebookSettings(request: Bgs_Protocol_NoData) -> EventLoopFuture<Bgs_Protocol_Sns_V1_GetFacebookSettingsResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetFacebookSettings))
    }

    func GetFacebookAccountLinkStatus(request: Bgs_Protocol_Sns_V1_GetFacebookAccountLinkStatusRequest) -> EventLoopFuture<Bgs_Protocol_Sns_V1_GetFacebookAccountLinkStatusResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetFacebookAccountLinkStatus))
    }

    func GetGoogleAuthToken(request: Bgs_Protocol_Sns_V1_GetGoogleAuthTokenRequest) -> EventLoopFuture<Bgs_Protocol_Sns_V1_GetGoogleAuthTokenResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetGoogleAuthToken))
    }

    func GetGoogleSettings(request: Bgs_Protocol_NoData) -> EventLoopFuture<Bgs_Protocol_Sns_V1_GetGoogleSettingsResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetGoogleSettings))
    }

    func GetGoogleAccountLinkStatus(request: Bgs_Protocol_Sns_V1_GetGoogleAccountLinkStatusRequest) -> EventLoopFuture<Bgs_Protocol_Sns_V1_GetGoogleAccountLinkStatusResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetGoogleAccountLinkStatus))
    }
}
