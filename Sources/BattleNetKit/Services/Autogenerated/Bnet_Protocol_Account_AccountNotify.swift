import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Account_AccountNotify: ServiceType {
    enum Method: Int, MethodType {
        case OnAccountStateUpdated = 1
        case OnGameAccountStateUpdated = 2
        case OnGameAccountsUpdated = 3
        case OnGameSessionUpdated = 4

        var name: String {
            switch self {
            case .OnAccountStateUpdated: return "OnAccountStateUpdated"
            case .OnGameAccountStateUpdated: return "OnGameAccountStateUpdated"
            case .OnGameAccountsUpdated: return "OnGameAccountsUpdated"
            case .OnGameSessionUpdated: return "OnGameSessionUpdated"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnAccountStateUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountStateUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountsUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameSessionUpdated: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnAccountStateUpdated: return Bgs_Protocol_Account_V1_AccountStateNotification.self
            case .OnGameAccountStateUpdated: return Bgs_Protocol_Account_V1_GameAccountStateNotification.self
            case .OnGameAccountsUpdated: return Bgs_Protocol_Account_V1_GameAccountNotification.self
            case .OnGameSessionUpdated: return Bgs_Protocol_Account_V1_GameAccountSessionNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.account.AccountNotify"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Account_AccountNotifyHandler?

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

extension Bnet_Protocol_Account_AccountNotify {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnAccountStateUpdated:

                guard let message = request as? Bgs_Protocol_Account_V1_AccountStateNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Account_V1_AccountStateNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnAccountStateUpdated(request: message).map { $0 as Message }

            case .OnGameAccountStateUpdated:

                guard let message = request as? Bgs_Protocol_Account_V1_GameAccountStateNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Account_V1_GameAccountStateNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnGameAccountStateUpdated(request: message).map { $0 as Message }

            case .OnGameAccountsUpdated:

                guard let message = request as? Bgs_Protocol_Account_V1_GameAccountNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Account_V1_GameAccountNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnGameAccountsUpdated(request: message).map { $0 as Message }

            case .OnGameSessionUpdated:

                guard let message = request as? Bgs_Protocol_Account_V1_GameAccountSessionNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Account_V1_GameAccountSessionNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnGameSessionUpdated(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Account_AccountNotifyHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnAccountStateUpdated(request: Bgs_Protocol_Account_V1_AccountStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnGameAccountStateUpdated(request: Bgs_Protocol_Account_V1_GameAccountStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnGameAccountsUpdated(request: Bgs_Protocol_Account_V1_GameAccountNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnGameSessionUpdated(request: Bgs_Protocol_Account_V1_GameAccountSessionNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Account_AccountNotifyHandler {
    func OnAccountStateUpdated(request: Bgs_Protocol_Account_V1_AccountStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Account_AccountNotify.Method.OnAccountStateUpdated,
                of: Bnet_Protocol_Account_AccountNotify.self
            )
        )
    }

    func OnGameAccountStateUpdated(request: Bgs_Protocol_Account_V1_GameAccountStateNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Account_AccountNotify.Method.OnGameAccountStateUpdated,
                of: Bnet_Protocol_Account_AccountNotify.self
            )
        )
    }

    func OnGameAccountsUpdated(request: Bgs_Protocol_Account_V1_GameAccountNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Account_AccountNotify.Method.OnGameAccountsUpdated,
                of: Bnet_Protocol_Account_AccountNotify.self
            )
        )
    }

    func OnGameSessionUpdated(request: Bgs_Protocol_Account_V1_GameAccountSessionNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Account_AccountNotify.Method.OnGameSessionUpdated,
                of: Bnet_Protocol_Account_AccountNotify.self
            )
        )
    }
}
