import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_V2_ChannelListener: ServiceType {
    enum Method: Int, MethodType {
        case OnMemberAdded = 3
        case OnMemberRemoved = 4
        case OnMemberAttributeChanged = 5
        case OnMemberRoleChanged = 6
        case OnSendMessage = 10
        case OnTypingIndicator = 11
        case OnAttributeChanged = 16
        case OnPrivacyLevelChanged = 17
        case OnInvitationAdded = 18
        case OnInvitationRemoved = 19
        case OnSuggestionAdded = 20

        var name: String {
            switch self {
            case .OnMemberAdded: return "OnMemberAdded"
            case .OnMemberRemoved: return "OnMemberRemoved"
            case .OnMemberAttributeChanged: return "OnMemberAttributeChanged"
            case .OnMemberRoleChanged: return "OnMemberRoleChanged"
            case .OnSendMessage: return "OnSendMessage"
            case .OnTypingIndicator: return "OnTypingIndicator"
            case .OnAttributeChanged: return "OnAttributeChanged"
            case .OnPrivacyLevelChanged: return "OnPrivacyLevelChanged"
            case .OnInvitationAdded: return "OnInvitationAdded"
            case .OnInvitationRemoved: return "OnInvitationRemoved"
            case .OnSuggestionAdded: return "OnSuggestionAdded"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnMemberAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberAttributeChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberRoleChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSendMessage: return Bgs_Protocol_NO_RESPONSE.self
            case .OnTypingIndicator: return Bgs_Protocol_NO_RESPONSE.self
            case .OnAttributeChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnPrivacyLevelChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSuggestionAdded: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnMemberAdded: return Bgs_Protocol_Channel_V2_MemberAddedNotification.self
            case .OnMemberRemoved: return Bgs_Protocol_Channel_V2_MemberRemovedNotification.self
            case .OnMemberAttributeChanged: return Bgs_Protocol_Channel_V2_MemberAttributeChangedNotification.self
            case .OnMemberRoleChanged: return Bgs_Protocol_Channel_V2_MemberRoleChangedNotification.self
            case .OnSendMessage: return Bgs_Protocol_Channel_V2_SendMessageNotification.self
            case .OnTypingIndicator: return Bgs_Protocol_Channel_V2_TypingIndicatorNotification.self
            case .OnAttributeChanged: return Bgs_Protocol_Channel_V2_AttributeChangedNotification.self
            case .OnPrivacyLevelChanged: return Bgs_Protocol_Channel_V2_PrivacyLevelChangedNotification.self
            case .OnInvitationAdded: return Bgs_Protocol_Channel_V2_InvitationAddedNotification.self
            case .OnInvitationRemoved: return Bgs_Protocol_Channel_V2_InvitationRemovedNotification.self
            case .OnSuggestionAdded: return Bgs_Protocol_Channel_V2_SuggestionAddedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.v2.ChannelListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Channel_V2_ChannelListenerHandler?

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

extension Bnet_Protocol_Channel_V2_ChannelListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnMemberAdded:

                guard let message = request as? Bgs_Protocol_Channel_V2_MemberAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_MemberAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemberAdded(request: message).map { $0 as Message }

            case .OnMemberRemoved:

                guard let message = request as? Bgs_Protocol_Channel_V2_MemberRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_MemberRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemberRemoved(request: message).map { $0 as Message }

            case .OnMemberAttributeChanged:

                guard let message = request as? Bgs_Protocol_Channel_V2_MemberAttributeChangedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_MemberAttributeChangedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemberAttributeChanged(request: message).map { $0 as Message }

            case .OnMemberRoleChanged:

                guard let message = request as? Bgs_Protocol_Channel_V2_MemberRoleChangedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_MemberRoleChangedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemberRoleChanged(request: message).map { $0 as Message }

            case .OnSendMessage:

                guard let message = request as? Bgs_Protocol_Channel_V2_SendMessageNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_SendMessageNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSendMessage(request: message).map { $0 as Message }

            case .OnTypingIndicator:

                guard let message = request as? Bgs_Protocol_Channel_V2_TypingIndicatorNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_TypingIndicatorNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnTypingIndicator(request: message).map { $0 as Message }

            case .OnAttributeChanged:

                guard let message = request as? Bgs_Protocol_Channel_V2_AttributeChangedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_AttributeChangedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnAttributeChanged(request: message).map { $0 as Message }

            case .OnPrivacyLevelChanged:

                guard let message = request as? Bgs_Protocol_Channel_V2_PrivacyLevelChangedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_PrivacyLevelChangedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnPrivacyLevelChanged(request: message).map { $0 as Message }

            case .OnInvitationAdded:

                guard let message = request as? Bgs_Protocol_Channel_V2_InvitationAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_InvitationAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnInvitationAdded(request: message).map { $0 as Message }

            case .OnInvitationRemoved:

                guard let message = request as? Bgs_Protocol_Channel_V2_InvitationRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_InvitationRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnInvitationRemoved(request: message).map { $0 as Message }

            case .OnSuggestionAdded:

                guard let message = request as? Bgs_Protocol_Channel_V2_SuggestionAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_SuggestionAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSuggestionAdded(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Channel_V2_ChannelListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnMemberAdded(request: Bgs_Protocol_Channel_V2_MemberAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnMemberRemoved(request: Bgs_Protocol_Channel_V2_MemberRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnMemberAttributeChanged(request: Bgs_Protocol_Channel_V2_MemberAttributeChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnMemberRoleChanged(request: Bgs_Protocol_Channel_V2_MemberRoleChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSendMessage(request: Bgs_Protocol_Channel_V2_SendMessageNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnTypingIndicator(request: Bgs_Protocol_Channel_V2_TypingIndicatorNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnAttributeChanged(request: Bgs_Protocol_Channel_V2_AttributeChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnPrivacyLevelChanged(request: Bgs_Protocol_Channel_V2_PrivacyLevelChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnInvitationAdded(request: Bgs_Protocol_Channel_V2_InvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnInvitationRemoved(request: Bgs_Protocol_Channel_V2_InvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSuggestionAdded(request: Bgs_Protocol_Channel_V2_SuggestionAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Channel_V2_ChannelListenerHandler {
    func OnMemberAdded(request: Bgs_Protocol_Channel_V2_MemberAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnMemberAdded,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnMemberRemoved(request: Bgs_Protocol_Channel_V2_MemberRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnMemberRemoved,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnMemberAttributeChanged(request: Bgs_Protocol_Channel_V2_MemberAttributeChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnMemberAttributeChanged,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnMemberRoleChanged(request: Bgs_Protocol_Channel_V2_MemberRoleChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnMemberRoleChanged,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnSendMessage(request: Bgs_Protocol_Channel_V2_SendMessageNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnSendMessage,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnTypingIndicator(request: Bgs_Protocol_Channel_V2_TypingIndicatorNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnTypingIndicator,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnAttributeChanged(request: Bgs_Protocol_Channel_V2_AttributeChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnAttributeChanged,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnPrivacyLevelChanged(request: Bgs_Protocol_Channel_V2_PrivacyLevelChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnPrivacyLevelChanged,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnInvitationAdded(request: Bgs_Protocol_Channel_V2_InvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnInvitationAdded,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnInvitationRemoved(request: Bgs_Protocol_Channel_V2_InvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnInvitationRemoved,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }

    func OnSuggestionAdded(request: Bgs_Protocol_Channel_V2_SuggestionAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_ChannelListener.Method.OnSuggestionAdded,
                of: Bnet_Protocol_Channel_V2_ChannelListener.self
            )
        )
    }
}
