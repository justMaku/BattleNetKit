import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Authentication_AuthenticationClient: ServiceType {
    enum Method: Int, MethodType {
        case OnModuleLoad = 1
        case OnModuleMessage = 2
        case OnServerStateChange = 4
        case OnLogonComplete = 5
        case OnMemModuleLoad = 6
        case OnLogonUpdate = 10
        case OnVersionInfoUpdated = 11
        case OnLogonQueueUpdate = 12
        case OnLogonQueueEnd = 13
        case OnGameAccountSelected = 14

        var name: String {
            switch self {
            case .OnModuleLoad: return "OnModuleLoad"
            case .OnModuleMessage: return "OnModuleMessage"
            case .OnServerStateChange: return "OnServerStateChange"
            case .OnLogonComplete: return "OnLogonComplete"
            case .OnMemModuleLoad: return "OnMemModuleLoad"
            case .OnLogonUpdate: return "OnLogonUpdate"
            case .OnVersionInfoUpdated: return "OnVersionInfoUpdated"
            case .OnLogonQueueUpdate: return "OnLogonQueueUpdate"
            case .OnLogonQueueEnd: return "OnLogonQueueEnd"
            case .OnGameAccountSelected: return "OnGameAccountSelected"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnModuleLoad: return Bgs_Protocol_NO_RESPONSE.self
            case .OnModuleMessage: return Bgs_Protocol_NoData.self
            case .OnServerStateChange: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLogonComplete: return Bgs_Protocol_NO_RESPONSE.self
            case .OnMemModuleLoad: return Bgs_Protocol_Authentication_V1_MemModuleLoadResponse.self
            case .OnLogonUpdate: return Bgs_Protocol_NO_RESPONSE.self
            case .OnVersionInfoUpdated: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLogonQueueUpdate: return Bgs_Protocol_NO_RESPONSE.self
            case .OnLogonQueueEnd: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountSelected: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnModuleLoad: return Bgs_Protocol_Authentication_V1_ModuleLoadRequest.self
            case .OnModuleMessage: return Bgs_Protocol_Authentication_V1_ModuleMessageRequest.self
            case .OnServerStateChange: return Bgs_Protocol_Authentication_V1_ServerStateChangeRequest.self
            case .OnLogonComplete: return Bgs_Protocol_Authentication_V1_LogonResult.self
            case .OnMemModuleLoad: return Bgs_Protocol_Authentication_V1_MemModuleLoadRequest.self
            case .OnLogonUpdate: return Bgs_Protocol_Authentication_V1_LogonUpdateRequest.self
            case .OnVersionInfoUpdated: return Bgs_Protocol_Authentication_V1_VersionInfoNotification.self
            case .OnLogonQueueUpdate: return Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest.self
            case .OnLogonQueueEnd: return Bgs_Protocol_NoData.self
            case .OnGameAccountSelected: return Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.authentication.AuthenticationClient"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Authentication_AuthenticationClientHandler?

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

extension Bnet_Protocol_Authentication_AuthenticationClient {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnModuleLoad:

                guard let message = request as? Bgs_Protocol_Authentication_V1_ModuleLoadRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_ModuleLoadRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnModuleLoad(request: message).map { $0 as Message }

            case .OnModuleMessage:

                guard let message = request as? Bgs_Protocol_Authentication_V1_ModuleMessageRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_ModuleMessageRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnModuleMessage(request: message).map { $0 as Message }

            case .OnServerStateChange:

                guard let message = request as? Bgs_Protocol_Authentication_V1_ServerStateChangeRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_ServerStateChangeRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnServerStateChange(request: message).map { $0 as Message }

            case .OnLogonComplete:

                guard let message = request as? Bgs_Protocol_Authentication_V1_LogonResult else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_LogonResult.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnLogonComplete(request: message).map { $0 as Message }

            case .OnMemModuleLoad:

                guard let message = request as? Bgs_Protocol_Authentication_V1_MemModuleLoadRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_MemModuleLoadRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnMemModuleLoad(request: message).map { $0 as Message }

            case .OnLogonUpdate:

                guard let message = request as? Bgs_Protocol_Authentication_V1_LogonUpdateRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_LogonUpdateRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnLogonUpdate(request: message).map { $0 as Message }

            case .OnVersionInfoUpdated:

                guard let message = request as? Bgs_Protocol_Authentication_V1_VersionInfoNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_VersionInfoNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnVersionInfoUpdated(request: message).map { $0 as Message }

            case .OnLogonQueueUpdate:

                guard let message = request as? Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnLogonQueueUpdate(request: message).map { $0 as Message }

            case .OnLogonQueueEnd:

                return delegate.OnLogonQueueEnd().map { $0 as Message }

            case .OnGameAccountSelected:

                guard let message = request as? Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnGameAccountSelected(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Authentication_AuthenticationClientHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnModuleLoad(request: Bgs_Protocol_Authentication_V1_ModuleLoadRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnModuleMessage(request: Bgs_Protocol_Authentication_V1_ModuleMessageRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData>

    func OnServerStateChange(request: Bgs_Protocol_Authentication_V1_ServerStateChangeRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnLogonComplete(request: Bgs_Protocol_Authentication_V1_LogonResult)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnMemModuleLoad(request: Bgs_Protocol_Authentication_V1_MemModuleLoadRequest)
        -> EventLoopFuture<Bgs_Protocol_Authentication_V1_MemModuleLoadResponse>

    func OnLogonUpdate(request: Bgs_Protocol_Authentication_V1_LogonUpdateRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnVersionInfoUpdated(request: Bgs_Protocol_Authentication_V1_VersionInfoNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnLogonQueueUpdate(request: Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnLogonQueueEnd()
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnGameAccountSelected(request: Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Authentication_AuthenticationClientHandler {
    func OnModuleLoad(request: Bgs_Protocol_Authentication_V1_ModuleLoadRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnModuleMessage(request: Bgs_Protocol_Authentication_V1_ModuleMessageRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnServerStateChange(request: Bgs_Protocol_Authentication_V1_ServerStateChangeRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnLogonComplete(request: Bgs_Protocol_Authentication_V1_LogonResult)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnMemModuleLoad(request: Bgs_Protocol_Authentication_V1_MemModuleLoadRequest)
        -> EventLoopFuture<Bgs_Protocol_Authentication_V1_MemModuleLoadResponse> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnLogonUpdate(request: Bgs_Protocol_Authentication_V1_LogonUpdateRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnVersionInfoUpdated(request: Bgs_Protocol_Authentication_V1_VersionInfoNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnLogonQueueUpdate(request: Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnLogonQueueEnd()
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func OnGameAccountSelected(request: Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }
}
