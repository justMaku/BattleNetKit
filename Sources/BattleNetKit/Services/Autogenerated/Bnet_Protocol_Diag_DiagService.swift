import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Diag_DiagService: ServiceType {
    enum Method: Int, MethodType {
        case GetVar = 1
        case SetVar = 2
        case Query = 3

        var name: String {
            switch self {
            case .GetVar: return "GetVar"
            case .SetVar: return "SetVar"
            case .Query: return "Query"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .GetVar: return Bgs_Protocol_Diag_V1_GetVarResponse.self
            case .SetVar: return Bgs_Protocol_NoData.self
            case .Query: return Bgs_Protocol_Diag_V1_QueryResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .GetVar: return Bgs_Protocol_Diag_V1_GetVarRequest.self
            case .SetVar: return Bgs_Protocol_Diag_V1_SetVarRequest.self
            case .Query: return Bgs_Protocol_Diag_V1_QueryRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.diag.DiagService"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Diag_DiagServiceHandler?

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

extension Bnet_Protocol_Diag_DiagService {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .GetVar:

                guard let message = request as? Bgs_Protocol_Diag_V1_GetVarRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Diag_V1_GetVarRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.GetVar(request: message).map { $0 as Message }

            case .SetVar:

                guard let message = request as? Bgs_Protocol_Diag_V1_SetVarRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Diag_V1_SetVarRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.SetVar(request: message).map { $0 as Message }

            case .Query:

                guard let message = request as? Bgs_Protocol_Diag_V1_QueryRequest else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Diag_V1_QueryRequest.self,
                        received: type(of: request)
                    )
                }
                return delegate.Query(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Diag_DiagServiceHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func GetVar(request: Bgs_Protocol_Diag_V1_GetVarRequest)
        -> EventLoopFuture<Bgs_Protocol_Diag_V1_GetVarResponse>

    func SetVar(request: Bgs_Protocol_Diag_V1_SetVarRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData>

    func Query(request: Bgs_Protocol_Diag_V1_QueryRequest)
        -> EventLoopFuture<Bgs_Protocol_Diag_V1_QueryResponse>
}

extension Bnet_Protocol_Diag_DiagServiceHandler {
    func GetVar(request: Bgs_Protocol_Diag_V1_GetVarRequest)
        -> EventLoopFuture<Bgs_Protocol_Diag_V1_GetVarResponse> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func SetVar(request: Bgs_Protocol_Diag_V1_SetVarRequest)
        -> EventLoopFuture<Bgs_Protocol_NoData> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }

    func Query(request: Bgs_Protocol_Diag_V1_QueryRequest)
        -> EventLoopFuture<Bgs_Protocol_Diag_V1_QueryResponse> {
        self.eventLoop.makeFailedFuture(MethodTypeError.unimplementedMethod)
    }
}
