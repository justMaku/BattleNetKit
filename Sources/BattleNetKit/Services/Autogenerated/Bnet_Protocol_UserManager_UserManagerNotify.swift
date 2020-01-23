import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_UserManager_UserManagerNotify: ServiceType {
    enum Method: Int, MethodType {
        case OnBlockedPlayerAdded = 1
        case OnBlockedPlayerRemoved = 2
        case OnRecentPlayersAdded = 11
        case OnRecentPlayersRemoved = 12

        var name: String {
            switch self {
            case .OnBlockedPlayerAdded: return "OnBlockedPlayerAdded"
            case .OnBlockedPlayerRemoved: return "OnBlockedPlayerRemoved"
            case .OnRecentPlayersAdded: return "OnRecentPlayersAdded"
            case .OnRecentPlayersRemoved: return "OnRecentPlayersRemoved"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnBlockedPlayerAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnBlockedPlayerRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnRecentPlayersAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnRecentPlayersRemoved: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnBlockedPlayerAdded: return Bgs_Protocol_UserManager_V1_BlockedPlayerAddedNotification.self
            case .OnBlockedPlayerRemoved: return Bgs_Protocol_UserManager_V1_BlockedPlayerRemovedNotification.self
            case .OnRecentPlayersAdded: return Bgs_Protocol_UserManager_V1_RecentPlayersAddedNotification.self
            case .OnRecentPlayersRemoved: return Bgs_Protocol_UserManager_V1_RecentPlayersRemovedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.user_manager.UserManagerNotify"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_UserManager_UserManagerNotifyHandler?

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

extension Bnet_Protocol_UserManager_UserManagerNotify {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnBlockedPlayerAdded:

                guard let message = request as? Bgs_Protocol_UserManager_V1_BlockedPlayerAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_UserManager_V1_BlockedPlayerAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnBlockedPlayerAdded(request: message).map { $0 as Message }

            case .OnBlockedPlayerRemoved:

                guard let message = request as? Bgs_Protocol_UserManager_V1_BlockedPlayerRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_UserManager_V1_BlockedPlayerRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnBlockedPlayerRemoved(request: message).map { $0 as Message }

            case .OnRecentPlayersAdded:

                guard let message = request as? Bgs_Protocol_UserManager_V1_RecentPlayersAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_UserManager_V1_RecentPlayersAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnRecentPlayersAdded(request: message).map { $0 as Message }

            case .OnRecentPlayersRemoved:

                guard let message = request as? Bgs_Protocol_UserManager_V1_RecentPlayersRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_UserManager_V1_RecentPlayersRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnRecentPlayersRemoved(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_UserManager_UserManagerNotifyHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnBlockedPlayerAdded(request: Bgs_Protocol_UserManager_V1_BlockedPlayerAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnBlockedPlayerRemoved(request: Bgs_Protocol_UserManager_V1_BlockedPlayerRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnRecentPlayersAdded(request: Bgs_Protocol_UserManager_V1_RecentPlayersAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnRecentPlayersRemoved(request: Bgs_Protocol_UserManager_V1_RecentPlayersRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_UserManager_UserManagerNotifyHandler {
    func OnBlockedPlayerAdded(request: Bgs_Protocol_UserManager_V1_BlockedPlayerAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnBlockedPlayerRemoved(request: Bgs_Protocol_UserManager_V1_BlockedPlayerRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnRecentPlayersAdded(request: Bgs_Protocol_UserManager_V1_RecentPlayersAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnRecentPlayersRemoved(request: Bgs_Protocol_UserManager_V1_RecentPlayersRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }
}
