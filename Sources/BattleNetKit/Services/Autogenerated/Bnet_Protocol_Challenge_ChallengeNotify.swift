import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Challenge_ChallengeNotify: ServiceType {
    enum Method: Int, MethodType {
        case OnExternalChallenge = 3
        case OnExternalChallengeResult = 4

        var name: String {
            switch self {
            case .OnExternalChallenge: return "OnExternalChallenge"
            case .OnExternalChallengeResult: return "OnExternalChallengeResult"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnExternalChallenge: return Bgs_Protocol_NO_RESPONSE.self
            case .OnExternalChallengeResult: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnExternalChallenge: return Bgs_Protocol_Challenge_V1_ChallengeExternalRequest.self
            case .OnExternalChallengeResult: return Bgs_Protocol_Challenge_V1_ChallengeExternalResult.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.challenge.ChallengeNotify"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Challenge_ChallengeNotifyHandler?

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

extension Bnet_Protocol_Challenge_ChallengeNotify {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnExternalChallenge:

                guard let message = request as? Bgs_Protocol_Challenge_V1_ChallengeExternalRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Challenge_V1_ChallengeExternalRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnExternalChallenge(request: message).map { $0 as Message }

            case .OnExternalChallengeResult:

                guard let message = request as? Bgs_Protocol_Challenge_V1_ChallengeExternalResult else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Challenge_V1_ChallengeExternalResult.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnExternalChallengeResult(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Challenge_ChallengeNotifyHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnExternalChallenge(request: Bgs_Protocol_Challenge_V1_ChallengeExternalRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnExternalChallengeResult(request: Bgs_Protocol_Challenge_V1_ChallengeExternalResult)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Challenge_ChallengeNotifyHandler {
    func OnExternalChallenge(request: Bgs_Protocol_Challenge_V1_ChallengeExternalRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Challenge_ChallengeNotify.Method.OnExternalChallenge,
                of: Bnet_Protocol_Challenge_ChallengeNotify.self
            )
        )
    }

    func OnExternalChallengeResult(request: Bgs_Protocol_Challenge_V1_ChallengeExternalResult)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Challenge_ChallengeNotify.Method.OnExternalChallengeResult,
                of: Bnet_Protocol_Challenge_ChallengeNotify.self
            )
        )
    }
}
