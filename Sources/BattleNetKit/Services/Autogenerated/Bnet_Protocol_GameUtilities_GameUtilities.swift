import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_GameUtilities_GameUtilities: ServiceType {
    enum Method: Int, MethodType {
        case ProcessClientRequest = 1
        case PresenceChannelCreated = 2
        case GetPlayerVariables = 3
        case ProcessServerRequest = 6
        case OnGameAccountOnline = 7
        case OnGameAccountOffline = 8
        case GetAchievementsFile = 9
        case GetAllValuesForAttribute = 10
        case RegisterUtilities = 11
        case UnregisterUtilities = 12

        var name: String {
            switch self {
            case .ProcessClientRequest: return "ProcessClientRequest"
            case .PresenceChannelCreated: return "PresenceChannelCreated"
            case .GetPlayerVariables: return "GetPlayerVariables"
            case .ProcessServerRequest: return "ProcessServerRequest"
            case .OnGameAccountOnline: return "OnGameAccountOnline"
            case .OnGameAccountOffline: return "OnGameAccountOffline"
            case .GetAchievementsFile: return "GetAchievementsFile"
            case .GetAllValuesForAttribute: return "GetAllValuesForAttribute"
            case .RegisterUtilities: return "RegisterUtilities"
            case .UnregisterUtilities: return "UnregisterUtilities"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .ProcessClientRequest: return Bgs_Protocol_GameUtilities_V1_ClientResponse.self
            case .PresenceChannelCreated: return Bgs_Protocol_NoData.self
            case .GetPlayerVariables: return Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesResponse.self
            case .ProcessServerRequest: return Bgs_Protocol_GameUtilities_V1_ServerResponse.self
            case .OnGameAccountOnline: return Bgs_Protocol_NO_RESPONSE.self
            case .OnGameAccountOffline: return Bgs_Protocol_NO_RESPONSE.self
            case .GetAchievementsFile: return Bgs_Protocol_GameUtilities_V1_GetAchievementsFileResponse.self
            case .GetAllValuesForAttribute: return Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeResponse.self
            case .RegisterUtilities: return Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesResponse.self
            case .UnregisterUtilities: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .ProcessClientRequest: return Bgs_Protocol_GameUtilities_V1_ClientRequest.self
            case .PresenceChannelCreated: return Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest.self
            case .GetPlayerVariables: return Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest.self
            case .ProcessServerRequest: return Bgs_Protocol_GameUtilities_V1_ServerRequest.self
            case .OnGameAccountOnline: return Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification.self
            case .OnGameAccountOffline: return Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification.self
            case .GetAchievementsFile: return Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest.self
            case .GetAllValuesForAttribute: return Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest.self
            case .RegisterUtilities: return Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest.self
            case .UnregisterUtilities: return Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.game_utilities.GameUtilities"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_GameUtilities_GameUtilitiesHandler?

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

extension Bnet_Protocol_GameUtilities_GameUtilities {
    func ProcessClientRequest(request: Bgs_Protocol_GameUtilities_V1_ClientRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ClientResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ProcessClientRequest))
    }

    func PresenceChannelCreated(request: Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.PresenceChannelCreated))
    }

    func GetPlayerVariables(request: Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetPlayerVariables))
    }

    func ProcessServerRequest(request: Bgs_Protocol_GameUtilities_V1_ServerRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ServerResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ProcessServerRequest))
    }

    func OnGameAccountOnline(request: Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.OnGameAccountOnline))
    }

    func OnGameAccountOffline(request: Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.OnGameAccountOffline))
    }

    func GetAchievementsFile(request: Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetAchievementsFileResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetAchievementsFile))
    }

    func GetAllValuesForAttribute(request: Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetAllValuesForAttribute))
    }

    func RegisterUtilities(request: Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.RegisterUtilities))
    }

    func UnregisterUtilities(request: Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.UnregisterUtilities))
    }
}

extension Bnet_Protocol_GameUtilities_GameUtilities {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .ProcessClientRequest:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_ClientRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_ClientRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.ProcessClientRequest(request: message).map { $0 as Message }

            case .PresenceChannelCreated:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.PresenceChannelCreated(request: message).map { $0 as Message }

            case .GetPlayerVariables:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.GetPlayerVariables(request: message).map { $0 as Message }

            case .ProcessServerRequest:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_ServerRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_ServerRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.ProcessServerRequest(request: message).map { $0 as Message }

            case .OnGameAccountOnline:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnGameAccountOnline(request: message).map { $0 as Message }

            case .OnGameAccountOffline:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnGameAccountOffline(request: message).map { $0 as Message }

            case .GetAchievementsFile:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.GetAchievementsFile(request: message).map { $0 as Message }

            case .GetAllValuesForAttribute:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.GetAllValuesForAttribute(request: message).map { $0 as Message }

            case .RegisterUtilities:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.RegisterUtilities(request: message).map { $0 as Message }

            case .UnregisterUtilities:

                guard let message = request as? Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.UnregisterUtilities(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_GameUtilities_GameUtilitiesHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func ProcessClientRequest(request: Bgs_Protocol_GameUtilities_V1_ClientRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ClientResponse>

    func PresenceChannelCreated(request: Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData>

    func GetPlayerVariables(request: Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesResponse>

    func ProcessServerRequest(request: Bgs_Protocol_GameUtilities_V1_ServerRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ServerResponse>

    func OnGameAccountOnline(request: Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnGameAccountOffline(request: Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func GetAchievementsFile(request: Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetAchievementsFileResponse>

    func GetAllValuesForAttribute(request: Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeResponse>

    func RegisterUtilities(request: Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesResponse>

    func UnregisterUtilities(request: Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_GameUtilities_GameUtilitiesHandler {
    func ProcessClientRequest(request: Bgs_Protocol_GameUtilities_V1_ClientRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ClientResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.ProcessClientRequest,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func PresenceChannelCreated(request: Bgs_Protocol_GameUtilities_V1_PresenceChannelCreatedRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.PresenceChannelCreated,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func GetPlayerVariables(request: Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetPlayerVariablesResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.GetPlayerVariables,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func ProcessServerRequest(request: Bgs_Protocol_GameUtilities_V1_ServerRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ServerResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.ProcessServerRequest,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func OnGameAccountOnline(request: Bgs_Protocol_GameUtilities_V1_GameAccountOnlineNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.OnGameAccountOnline,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func OnGameAccountOffline(request: Bgs_Protocol_GameUtilities_V1_GameAccountOfflineNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.OnGameAccountOffline,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func GetAchievementsFile(request: Bgs_Protocol_GameUtilities_V1_GetAchievementsFileRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetAchievementsFileResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.GetAchievementsFile,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func GetAllValuesForAttribute(request: Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.GetAllValuesForAttribute,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func RegisterUtilities(request: Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesRequest)
        -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_RegisterUtilitiesResponse> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.RegisterUtilities,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }

    func UnregisterUtilities(request: Bgs_Protocol_GameUtilities_V1_UnregisterUtilitiesRequest)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_GameUtilities_GameUtilities.Method.UnregisterUtilities,
                of: Bnet_Protocol_GameUtilities_GameUtilities.self
            )
        )
    }
}
