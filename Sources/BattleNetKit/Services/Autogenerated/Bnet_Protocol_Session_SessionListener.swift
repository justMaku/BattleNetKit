import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Session_SessionListener: ServiceType {
    enum Method: Int, MethodType {
        case OnSessionCreated = 1
        case OnSessionDestroyed = 2
        case OnSessionUpdated = 3

        var name: String {
            switch self {
            case .OnSessionCreated: return "OnSessionCreated"
            case .OnSessionDestroyed: return "OnSessionDestroyed"
            case .OnSessionUpdated: return "OnSessionUpdated"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnSessionCreated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSessionDestroyed: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSessionUpdated: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnSessionCreated: return Bgs_Protocol_Session_V1_SessionCreatedNotification.self
            case .OnSessionDestroyed: return Bgs_Protocol_Session_V1_SessionDestroyedNotification.self
            case .OnSessionUpdated: return Bgs_Protocol_Session_V1_SessionUpdatedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.session.SessionListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Session_SessionListenerHandler?

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

extension Bnet_Protocol_Session_SessionListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnSessionCreated:

                guard let message = request as? Bgs_Protocol_Session_V1_SessionCreatedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Session_V1_SessionCreatedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSessionCreated(request: message).map { $0 as Message }

            case .OnSessionDestroyed:

                guard let message = request as? Bgs_Protocol_Session_V1_SessionDestroyedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Session_V1_SessionDestroyedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSessionDestroyed(request: message).map { $0 as Message }

            case .OnSessionUpdated:

                guard let message = request as? Bgs_Protocol_Session_V1_SessionUpdatedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Session_V1_SessionUpdatedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSessionUpdated(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Session_SessionListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnSessionCreated(request: Bgs_Protocol_Session_V1_SessionCreatedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSessionDestroyed(request: Bgs_Protocol_Session_V1_SessionDestroyedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSessionUpdated(request: Bgs_Protocol_Session_V1_SessionUpdatedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Session_SessionListenerHandler {
    func OnSessionCreated(request: Bgs_Protocol_Session_V1_SessionCreatedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnSessionDestroyed(request: Bgs_Protocol_Session_V1_SessionDestroyedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnSessionUpdated(request: Bgs_Protocol_Session_V1_SessionUpdatedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }
}
