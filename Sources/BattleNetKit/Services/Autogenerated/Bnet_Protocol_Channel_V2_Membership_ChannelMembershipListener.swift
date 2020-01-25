import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener: ServiceType {
    enum Method: Int, MethodType {
        case OnChannelAdded = 1
        case OnChannelRemoved = 2
        case OnReceivedInvitationAdded = 3
        case OnReceivedInvitationRemoved = 4

        var name: String {
            switch self {
            case .OnChannelAdded: return "OnChannelAdded"
            case .OnChannelRemoved: return "OnChannelRemoved"
            case .OnReceivedInvitationAdded: return "OnReceivedInvitationAdded"
            case .OnReceivedInvitationRemoved: return "OnReceivedInvitationRemoved"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnChannelAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnChannelRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnChannelAdded: return Bgs_Protocol_Channel_V2_Membership_ChannelAddedNotification.self
            case .OnChannelRemoved: return Bgs_Protocol_Channel_V2_Membership_ChannelRemovedNotification.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationAddedNotification.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationRemovedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.v2.membership.ChannelMembershipListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListenerHandler?

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

extension Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnChannelAdded:

                guard let message = request as? Bgs_Protocol_Channel_V2_Membership_ChannelAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_Membership_ChannelAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnChannelAdded(request: message).map { $0 as Message }

            case .OnChannelRemoved:

                guard let message = request as? Bgs_Protocol_Channel_V2_Membership_ChannelRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_Membership_ChannelRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnChannelRemoved(request: message).map { $0 as Message }

            case .OnReceivedInvitationAdded:

                guard let message = request as? Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnReceivedInvitationAdded(request: message).map { $0 as Message }

            case .OnReceivedInvitationRemoved:

                guard let message = request as? Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnReceivedInvitationRemoved(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnChannelAdded(request: Bgs_Protocol_Channel_V2_Membership_ChannelAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnChannelRemoved(request: Bgs_Protocol_Channel_V2_Membership_ChannelRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnReceivedInvitationAdded(request: Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnReceivedInvitationRemoved(request: Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListenerHandler {
    func OnChannelAdded(request: Bgs_Protocol_Channel_V2_Membership_ChannelAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.Method.OnChannelAdded,
                of: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.self
            )
        )
    }

    func OnChannelRemoved(request: Bgs_Protocol_Channel_V2_Membership_ChannelRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.Method.OnChannelRemoved,
                of: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.self
            )
        )
    }

    func OnReceivedInvitationAdded(request: Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.Method.OnReceivedInvitationAdded,
                of: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.self
            )
        )
    }

    func OnReceivedInvitationRemoved(request: Bgs_Protocol_Channel_V2_Membership_ReceivedInvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.Method.OnReceivedInvitationRemoved,
                of: Bnet_Protocol_Channel_V2_Membership_ChannelMembershipListener.self
            )
        )
    }
}
