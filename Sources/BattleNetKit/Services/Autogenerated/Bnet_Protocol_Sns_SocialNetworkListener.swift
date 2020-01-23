import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Sns_SocialNetworkListener: ServiceType {
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
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.sns.SocialNetworkListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Sns_SocialNetworkListenerHandler?

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

extension Bnet_Protocol_Sns_SocialNetworkListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnFacebookBnetFriendListReceived:

                guard let message = request as? Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnFacebookBnetFriendListReceived(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Sns_SocialNetworkListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnFacebookBnetFriendListReceived(request: Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotification)
        -> EventLoopFuture<Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotificationResponse>
}

extension Bnet_Protocol_Sns_SocialNetworkListenerHandler {
    func OnFacebookBnetFriendListReceived(request: Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotification)
        -> EventLoopFuture<Bgs_Protocol_Sns_V1_FacebookBnetFriendListNotificationResponse> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }
}
