import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Whisper_WhisperListener: ServiceType {
    enum Method: Int, MethodType {
        case OnWhisper = 1
        case OnWhisperEcho = 2
        case OnTypingIndicatorUpdate = 3
        case OnAdvanceViewTime = 4
        case OnWhisperUpdated = 5
        case OnAdvanceClearTime = 6

        var name: String {
            switch self {
            case .OnWhisper: return "OnWhisper"
            case .OnWhisperEcho: return "OnWhisperEcho"
            case .OnTypingIndicatorUpdate: return "OnTypingIndicatorUpdate"
            case .OnAdvanceViewTime: return "OnAdvanceViewTime"
            case .OnWhisperUpdated: return "OnWhisperUpdated"
            case .OnAdvanceClearTime: return "OnAdvanceClearTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnWhisper: return Bgs_Protocol_NO_RESPONSE.self
            case .OnWhisperEcho: return Bgs_Protocol_NO_RESPONSE.self
            case .OnTypingIndicatorUpdate: return Bgs_Protocol_NO_RESPONSE.self
            case .OnAdvanceViewTime: return Bgs_Protocol_NO_RESPONSE.self
            case .OnWhisperUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnAdvanceClearTime: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnWhisper: return Bgs_Protocol_Whisper_V1_WhisperNotification.self
            case .OnWhisperEcho: return Bgs_Protocol_Whisper_V1_WhisperEchoNotification.self
            case .OnTypingIndicatorUpdate: return Bgs_Protocol_Whisper_V1_TypingIndicatorNotification.self
            case .OnAdvanceViewTime: return Bgs_Protocol_Whisper_V1_AdvanceViewTimeNotification.self
            case .OnWhisperUpdated: return Bgs_Protocol_Whisper_V1_WhisperUpdatedNotification.self
            case .OnAdvanceClearTime: return Bgs_Protocol_Whisper_V1_AdvanceClearTimeNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.whisper.WhisperListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Whisper_WhisperListenerHandler?

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

extension Bnet_Protocol_Whisper_WhisperListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnWhisper:

                guard let message = request as? Bgs_Protocol_Whisper_V1_WhisperNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Whisper_V1_WhisperNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnWhisper(request: message).map { $0 as Message }

            case .OnWhisperEcho:

                guard let message = request as? Bgs_Protocol_Whisper_V1_WhisperEchoNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Whisper_V1_WhisperEchoNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnWhisperEcho(request: message).map { $0 as Message }

            case .OnTypingIndicatorUpdate:

                guard let message = request as? Bgs_Protocol_Whisper_V1_TypingIndicatorNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Whisper_V1_TypingIndicatorNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnTypingIndicatorUpdate(request: message).map { $0 as Message }

            case .OnAdvanceViewTime:

                guard let message = request as? Bgs_Protocol_Whisper_V1_AdvanceViewTimeNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Whisper_V1_AdvanceViewTimeNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnAdvanceViewTime(request: message).map { $0 as Message }

            case .OnWhisperUpdated:

                guard let message = request as? Bgs_Protocol_Whisper_V1_WhisperUpdatedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Whisper_V1_WhisperUpdatedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnWhisperUpdated(request: message).map { $0 as Message }

            case .OnAdvanceClearTime:

                guard let message = request as? Bgs_Protocol_Whisper_V1_AdvanceClearTimeNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Whisper_V1_AdvanceClearTimeNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnAdvanceClearTime(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Whisper_WhisperListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnWhisper(request: Bgs_Protocol_Whisper_V1_WhisperNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnWhisperEcho(request: Bgs_Protocol_Whisper_V1_WhisperEchoNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnTypingIndicatorUpdate(request: Bgs_Protocol_Whisper_V1_TypingIndicatorNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnAdvanceViewTime(request: Bgs_Protocol_Whisper_V1_AdvanceViewTimeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnWhisperUpdated(request: Bgs_Protocol_Whisper_V1_WhisperUpdatedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnAdvanceClearTime(request: Bgs_Protocol_Whisper_V1_AdvanceClearTimeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Whisper_WhisperListenerHandler {
    func OnWhisper(request: Bgs_Protocol_Whisper_V1_WhisperNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Whisper_WhisperListener.Method.OnWhisper,
                of: Bnet_Protocol_Whisper_WhisperListener.self
            )
        )
    }

    func OnWhisperEcho(request: Bgs_Protocol_Whisper_V1_WhisperEchoNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Whisper_WhisperListener.Method.OnWhisperEcho,
                of: Bnet_Protocol_Whisper_WhisperListener.self
            )
        )
    }

    func OnTypingIndicatorUpdate(request: Bgs_Protocol_Whisper_V1_TypingIndicatorNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Whisper_WhisperListener.Method.OnTypingIndicatorUpdate,
                of: Bnet_Protocol_Whisper_WhisperListener.self
            )
        )
    }

    func OnAdvanceViewTime(request: Bgs_Protocol_Whisper_V1_AdvanceViewTimeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Whisper_WhisperListener.Method.OnAdvanceViewTime,
                of: Bnet_Protocol_Whisper_WhisperListener.self
            )
        )
    }

    func OnWhisperUpdated(request: Bgs_Protocol_Whisper_V1_WhisperUpdatedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Whisper_WhisperListener.Method.OnWhisperUpdated,
                of: Bnet_Protocol_Whisper_WhisperListener.self
            )
        )
    }

    func OnAdvanceClearTime(request: Bgs_Protocol_Whisper_V1_AdvanceClearTimeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Whisper_WhisperListener.Method.OnAdvanceClearTime,
                of: Bnet_Protocol_Whisper_WhisperListener.self
            )
        )
    }
}
