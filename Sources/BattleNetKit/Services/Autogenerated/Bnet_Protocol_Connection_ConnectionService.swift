import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Connection_ConnectionService: ServiceType {
    enum Method: Int, MethodType {
        case Connect = 1
        case Bind = 2
        case Echo = 3
        case ForceDisconnect = 4
        case KeepAlive = 5
        case Encrypt = 6
        case RequestDisconnect = 7

        var name: String {
            switch self {
            case .Connect: return "Connect"
            case .Bind: return "Bind"
            case .Echo: return "Echo"
            case .ForceDisconnect: return "ForceDisconnect"
            case .KeepAlive: return "KeepAlive"
            case .Encrypt: return "Encrypt"
            case .RequestDisconnect: return "RequestDisconnect"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Connect: return Bgs_Protocol_Connection_V1_ConnectResponse.self
            case .Bind: return Bgs_Protocol_Connection_V1_BindResponse.self
            case .Echo: return Bgs_Protocol_Connection_V1_EchoResponse.self
            case .ForceDisconnect: return Bgs_Protocol_NO_RESPONSE.self
            case .KeepAlive: return Bgs_Protocol_NO_RESPONSE.self
            case .Encrypt: return Bgs_Protocol_NoData.self
            case .RequestDisconnect: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Connect: return Bgs_Protocol_Connection_V1_ConnectRequest.self
            case .Bind: return Bgs_Protocol_Connection_V1_BindRequest.self
            case .Echo: return Bgs_Protocol_Connection_V1_EchoRequest.self
            case .ForceDisconnect: return Bgs_Protocol_Connection_V1_DisconnectNotification.self
            case .KeepAlive: return Bgs_Protocol_NoData.self
            case .Encrypt: return Bgs_Protocol_Connection_V1_EncryptRequest.self
            case .RequestDisconnect: return Bgs_Protocol_Connection_V1_DisconnectRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.connection.ConnectionService"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Connection_ConnectionServiceHandler?

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

extension Bnet_Protocol_Connection_ConnectionService {
    func Connect(request: Bgs_Protocol_Connection_V1_ConnectRequest) -> EventLoopFuture<Bgs_Protocol_Connection_V1_ConnectResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Connect))
    }

    func Bind(request: Bgs_Protocol_Connection_V1_BindRequest) -> EventLoopFuture<Bgs_Protocol_Connection_V1_BindResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Bind))
    }

    func Echo(request: Bgs_Protocol_Connection_V1_EchoRequest) -> EventLoopFuture<Bgs_Protocol_Connection_V1_EchoResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Echo))
    }

    func ForceDisconnect(request: Bgs_Protocol_Connection_V1_DisconnectNotification) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ForceDisconnect))
    }

    func KeepAlive(request: Bgs_Protocol_NoData) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.KeepAlive))
    }

    func Encrypt(request: Bgs_Protocol_Connection_V1_EncryptRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Encrypt))
    }

    func RequestDisconnect(request: Bgs_Protocol_Connection_V1_DisconnectRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.RequestDisconnect))
    }
}

extension Bnet_Protocol_Connection_ConnectionService {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .Connect:

                guard let message = request as? Bgs_Protocol_Connection_V1_ConnectRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Connection_V1_ConnectRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.Connect(request: message).map { $0 as Message }

            case .Bind:

                guard let message = request as? Bgs_Protocol_Connection_V1_BindRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Connection_V1_BindRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.Bind(request: message).map { $0 as Message }

            case .Echo:

                guard let message = request as? Bgs_Protocol_Connection_V1_EchoRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Connection_V1_EchoRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.Echo(request: message).map { $0 as Message }

            case .ForceDisconnect:

                guard let message = request as? Bgs_Protocol_Connection_V1_DisconnectNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Connection_V1_DisconnectNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.ForceDisconnect(request: message).map { $0 as Message }

            case .KeepAlive:

                return delegate.KeepAlive().map { $0 as Message }

            case .Encrypt:

                guard let message = request as? Bgs_Protocol_Connection_V1_EncryptRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Connection_V1_EncryptRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.Encrypt(request: message).map { $0 as Message }

            case .RequestDisconnect:

                guard let message = request as? Bgs_Protocol_Connection_V1_DisconnectRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Connection_V1_DisconnectRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.RequestDisconnect(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Connection_ConnectionServiceHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func Connect(request: Bgs_Protocol_Connection_V1_ConnectRequest)
        -> EventLoopFuture<Bgs_Protocol_Connection_V1_ConnectResponse>

    func Bind(request: Bgs_Protocol_Connection_V1_BindRequest)
        -> EventLoopFuture<Bgs_Protocol_Connection_V1_BindResponse>

    func Echo(request: Bgs_Protocol_Connection_V1_EchoRequest)
        -> EventLoopFuture<Bgs_Protocol_Connection_V1_EchoResponse>

    func ForceDisconnect(request: Bgs_Protocol_Connection_V1_DisconnectNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func KeepAlive()
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func Encrypt(request: Bgs_Protocol_Connection_V1_EncryptRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData>

    func RequestDisconnect(request: Bgs_Protocol_Connection_V1_DisconnectRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Connection_ConnectionServiceHandler {
    func Connect(request: Bgs_Protocol_Connection_V1_ConnectRequest)
        -> EventLoopFuture<Bgs_Protocol_Connection_V1_ConnectResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.Connect,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }

    func Bind(request: Bgs_Protocol_Connection_V1_BindRequest)
        -> EventLoopFuture<Bgs_Protocol_Connection_V1_BindResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.Bind,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }

    func Echo(request: Bgs_Protocol_Connection_V1_EchoRequest)
        -> EventLoopFuture<Bgs_Protocol_Connection_V1_EchoResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.Echo,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }

    func ForceDisconnect(request: Bgs_Protocol_Connection_V1_DisconnectNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.ForceDisconnect,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }

    func KeepAlive()
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.KeepAlive,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }

    func Encrypt(request: Bgs_Protocol_Connection_V1_EncryptRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.Encrypt,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }

    func RequestDisconnect(request: Bgs_Protocol_Connection_V1_DisconnectRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Connection_ConnectionService.Method.RequestDisconnect,
                of: Bnet_Protocol_Connection_ConnectionService.self
            )
        )
    }
}
