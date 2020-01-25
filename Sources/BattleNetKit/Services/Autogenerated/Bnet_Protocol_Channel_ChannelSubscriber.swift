import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Channel_ChannelSubscriber: ServiceType {
    enum Method: Int, MethodType {
        case OnJoin = 1
        case OnMemberAdded = 2
        case OnLeave = 3
        case OnMemberRemoved = 4
        case OnSendMessage = 5
        case OnUpdateChannelState = 6
        case OnUpdateMemberState = 7

        var name: String {
            switch self {
            case .OnJoin: return "OnJoin"
            case .OnMemberAdded: return "OnMemberAdded"
            case .OnLeave: return "OnLeave"
            case .OnMemberRemoved: return "OnMemberRemoved"
            case .OnSendMessage: return "OnSendMessage"
            case .OnUpdateChannelState: return "OnUpdateChannelState"
            case .OnUpdateMemberState: return "OnUpdateMemberState"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnJoin: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLeave: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemberRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSendMessage: return Bgs_Protocol_NO_RESPONSE.self
            case .OnUpdateChannelState: return Bgs_Protocol_NO_RESPONSE.self
            case .OnUpdateMemberState: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnJoin: return Bgs_Protocol_Channel_V1_JoinNotification.self
            case .OnMemberAdded: return Bgs_Protocol_Channel_V1_MemberAddedNotification.self
            case .OnLeave: return Bgs_Protocol_Channel_V1_LeaveNotification.self
            case .OnMemberRemoved: return Bgs_Protocol_Channel_V1_MemberRemovedNotification.self
            case .OnSendMessage: return Bgs_Protocol_Channel_V1_SendMessageNotification.self
            case .OnUpdateChannelState: return Bgs_Protocol_Channel_V1_UpdateChannelStateNotification.self
            case .OnUpdateMemberState: return Bgs_Protocol_Channel_V1_UpdateMemberStateNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.channel.ChannelSubscriber"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Channel_ChannelSubscriberHandler?

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

extension Bnet_Protocol_Channel_ChannelSubscriber {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnJoin:

                guard let message = request as? Bgs_Protocol_Channel_V1_JoinNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_JoinNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnJoin(request: message).map { $0 as Message }

            case .OnMemberAdded:

                guard let message = request as? Bgs_Protocol_Channel_V1_MemberAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_MemberAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemberAdded(request: message).map { $0 as Message }

            case .OnLeave:

                guard let message = request as? Bgs_Protocol_Channel_V1_LeaveNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_LeaveNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnLeave(request: message).map { $0 as Message }

            case .OnMemberRemoved:

                guard let message = request as? Bgs_Protocol_Channel_V1_MemberRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_MemberRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemberRemoved(request: message).map { $0 as Message }

            case .OnSendMessage:

                guard let message = request as? Bgs_Protocol_Channel_V1_SendMessageNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_SendMessageNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSendMessage(request: message).map { $0 as Message }

            case .OnUpdateChannelState:

                guard let message = request as? Bgs_Protocol_Channel_V1_UpdateChannelStateNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_UpdateChannelStateNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnUpdateChannelState(request: message).map { $0 as Message }

            case .OnUpdateMemberState:

                guard let message = request as? Bgs_Protocol_Channel_V1_UpdateMemberStateNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Channel_V1_UpdateMemberStateNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnUpdateMemberState(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Channel_ChannelSubscriberHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnJoin(request: Bgs_Protocol_Channel_V1_JoinNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnMemberAdded(request: Bgs_Protocol_Channel_V1_MemberAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnLeave(request: Bgs_Protocol_Channel_V1_LeaveNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnMemberRemoved(request: Bgs_Protocol_Channel_V1_MemberRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSendMessage(request: Bgs_Protocol_Channel_V1_SendMessageNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnUpdateChannelState(request: Bgs_Protocol_Channel_V1_UpdateChannelStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnUpdateMemberState(request: Bgs_Protocol_Channel_V1_UpdateMemberStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Channel_ChannelSubscriberHandler {
    func OnJoin(request: Bgs_Protocol_Channel_V1_JoinNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnJoin,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }

    func OnMemberAdded(request: Bgs_Protocol_Channel_V1_MemberAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnMemberAdded,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }

    func OnLeave(request: Bgs_Protocol_Channel_V1_LeaveNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnLeave,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }

    func OnMemberRemoved(request: Bgs_Protocol_Channel_V1_MemberRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnMemberRemoved,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }

    func OnSendMessage(request: Bgs_Protocol_Channel_V1_SendMessageNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnSendMessage,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }

    func OnUpdateChannelState(request: Bgs_Protocol_Channel_V1_UpdateChannelStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnUpdateChannelState,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }

    func OnUpdateMemberState(request: Bgs_Protocol_Channel_V1_UpdateMemberStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Channel_ChannelSubscriber.Method.OnUpdateMemberState,
                of: Bnet_Protocol_Channel_ChannelSubscriber.self
            )
        )
    }
}
