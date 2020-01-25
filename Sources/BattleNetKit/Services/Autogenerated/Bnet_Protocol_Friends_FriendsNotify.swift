import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Friends_FriendsNotify: ServiceType {
    enum Method: Int, MethodType {
        case OnFriendAdded = 1
        case OnFriendRemoved = 2
        case OnReceivedInvitationAdded = 3
        case OnReceivedInvitationRemoved = 4
        case OnSentInvitationAdded = 5
        case OnSentInvitationRemoved = 6
        case OnUpdateFriendState = 7

        var name: String {
            switch self {
            case .OnFriendAdded: return "OnFriendAdded"
            case .OnFriendRemoved: return "OnFriendRemoved"
            case .OnReceivedInvitationAdded: return "OnReceivedInvitationAdded"
            case .OnReceivedInvitationRemoved: return "OnReceivedInvitationRemoved"
            case .OnSentInvitationAdded: return "OnSentInvitationAdded"
            case .OnSentInvitationRemoved: return "OnSentInvitationRemoved"
            case .OnUpdateFriendState: return "OnUpdateFriendState"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnFriendAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnFriendRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSentInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSentInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnUpdateFriendState: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnFriendAdded: return Bgs_Protocol_Friends_V1_FriendNotification.self
            case .OnFriendRemoved: return Bgs_Protocol_Friends_V1_FriendNotification.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_Friends_V1_InvitationNotification.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_Friends_V1_InvitationNotification.self
            case .OnSentInvitationAdded: return Bgs_Protocol_Friends_V1_SentInvitationAddedNotification.self
            case .OnSentInvitationRemoved: return Bgs_Protocol_Friends_V1_SentInvitationRemovedNotification.self
            case .OnUpdateFriendState: return Bgs_Protocol_Friends_V1_UpdateFriendStateNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.friends.FriendsNotify"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Friends_FriendsNotifyHandler?

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

extension Bnet_Protocol_Friends_FriendsNotify {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnFriendAdded:

                guard let message = request as? Bgs_Protocol_Friends_V1_FriendNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_FriendNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnFriendAdded(request: message).map { $0 as Message }

            case .OnFriendRemoved:

                guard let message = request as? Bgs_Protocol_Friends_V1_FriendNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_FriendNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnFriendRemoved(request: message).map { $0 as Message }

            case .OnReceivedInvitationAdded:

                guard let message = request as? Bgs_Protocol_Friends_V1_InvitationNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_InvitationNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnReceivedInvitationAdded(request: message).map { $0 as Message }

            case .OnReceivedInvitationRemoved:

                guard let message = request as? Bgs_Protocol_Friends_V1_InvitationNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_InvitationNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnReceivedInvitationRemoved(request: message).map { $0 as Message }

            case .OnSentInvitationAdded:

                guard let message = request as? Bgs_Protocol_Friends_V1_SentInvitationAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_SentInvitationAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSentInvitationAdded(request: message).map { $0 as Message }

            case .OnSentInvitationRemoved:

                guard let message = request as? Bgs_Protocol_Friends_V1_SentInvitationRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_SentInvitationRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSentInvitationRemoved(request: message).map { $0 as Message }

            case .OnUpdateFriendState:

                guard let message = request as? Bgs_Protocol_Friends_V1_UpdateFriendStateNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Friends_V1_UpdateFriendStateNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnUpdateFriendState(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Friends_FriendsNotifyHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnFriendAdded(request: Bgs_Protocol_Friends_V1_FriendNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnFriendRemoved(request: Bgs_Protocol_Friends_V1_FriendNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnReceivedInvitationAdded(request: Bgs_Protocol_Friends_V1_InvitationNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnReceivedInvitationRemoved(request: Bgs_Protocol_Friends_V1_InvitationNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSentInvitationAdded(request: Bgs_Protocol_Friends_V1_SentInvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSentInvitationRemoved(request: Bgs_Protocol_Friends_V1_SentInvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnUpdateFriendState(request: Bgs_Protocol_Friends_V1_UpdateFriendStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Friends_FriendsNotifyHandler {
    func OnFriendAdded(request: Bgs_Protocol_Friends_V1_FriendNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnFriendAdded,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }

    func OnFriendRemoved(request: Bgs_Protocol_Friends_V1_FriendNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnFriendRemoved,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }

    func OnReceivedInvitationAdded(request: Bgs_Protocol_Friends_V1_InvitationNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnReceivedInvitationAdded,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }

    func OnReceivedInvitationRemoved(request: Bgs_Protocol_Friends_V1_InvitationNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnReceivedInvitationRemoved,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }

    func OnSentInvitationAdded(request: Bgs_Protocol_Friends_V1_SentInvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnSentInvitationAdded,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }

    func OnSentInvitationRemoved(request: Bgs_Protocol_Friends_V1_SentInvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnSentInvitationRemoved,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }

    func OnUpdateFriendState(request: Bgs_Protocol_Friends_V1_UpdateFriendStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Friends_FriendsNotify.Method.OnUpdateFriendState,
                of: Bnet_Protocol_Friends_FriendsNotify.self
            )
        )
    }
}
