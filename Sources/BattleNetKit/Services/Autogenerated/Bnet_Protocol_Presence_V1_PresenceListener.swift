import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Presence_V1_PresenceListener: ServiceType {
    enum Method: Int, MethodType {
        case OnSubscribe = 1
        case OnStateChanged = 2

        var name: String {
            switch self {
            case .OnSubscribe: return "OnSubscribe"
            case .OnStateChanged: return "OnStateChanged"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnSubscribe: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStateChanged: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnSubscribe: return Bgs_Protocol_Presence_V1_SubscribeNotification.self
            case .OnStateChanged: return Bgs_Protocol_Presence_V1_StateChangedNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.presence.v1.PresenceListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Presence_V1_PresenceListenerHandler?

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

extension Bnet_Protocol_Presence_V1_PresenceListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnSubscribe:

                guard let message = request as? Bgs_Protocol_Presence_V1_SubscribeNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Presence_V1_SubscribeNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSubscribe(request: message).map { $0 as Message }

            case .OnStateChanged:

                guard let message = request as? Bgs_Protocol_Presence_V1_StateChangedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Presence_V1_StateChangedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnStateChanged(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Presence_V1_PresenceListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnSubscribe(request: Bgs_Protocol_Presence_V1_SubscribeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnStateChanged(request: Bgs_Protocol_Presence_V1_StateChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Presence_V1_PresenceListenerHandler {
    func OnSubscribe(request: Bgs_Protocol_Presence_V1_SubscribeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnStateChanged(request: Bgs_Protocol_Presence_V1_StateChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }
}
