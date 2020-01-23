import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Authentication_AuthenticationServer: ServiceType {
    enum Method: Int, MethodType {
        case Logon = 1
        case ModuleNotify = 2
        case ModuleMessage = 3
        case SelectGameAccount_DEPRECATED = 4
        case GenerateSSOToken = 5
        case SelectGameAccount = 6
        case VerifyWebCredentials = 7
        case GenerateWebCredentials = 8

        var name: String {
            switch self {
            case .Logon: return "Logon"
            case .ModuleNotify: return "ModuleNotify"
            case .ModuleMessage: return "ModuleMessage"
            case .SelectGameAccount_DEPRECATED: return "SelectGameAccount_DEPRECATED"
            case .GenerateSSOToken: return "GenerateSSOToken"
            case .SelectGameAccount: return "SelectGameAccount"
            case .VerifyWebCredentials: return "VerifyWebCredentials"
            case .GenerateWebCredentials: return "GenerateWebCredentials"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Logon: return Bgs_Protocol_NoData.self
            case .ModuleNotify: return Bgs_Protocol_NoData.self
            case .ModuleMessage: return Bgs_Protocol_NoData.self
            case .SelectGameAccount_DEPRECATED: return Bgs_Protocol_NoData.self
            case .GenerateSSOToken: return Bgs_Protocol_Authentication_V1_GenerateSSOTokenResponse.self
            case .SelectGameAccount: return Bgs_Protocol_NoData.self
            case .VerifyWebCredentials: return Bgs_Protocol_NoData.self
            case .GenerateWebCredentials: return Bgs_Protocol_Authentication_V1_GenerateWebCredentialsResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Logon: return Bgs_Protocol_Authentication_V1_LogonRequest.self
            case .ModuleNotify: return Bgs_Protocol_Authentication_V1_ModuleNotification.self
            case .ModuleMessage: return Bgs_Protocol_Authentication_V1_ModuleMessageRequest.self
            case .SelectGameAccount_DEPRECATED: return Bgs_Protocol_EntityId.self
            case .GenerateSSOToken: return Bgs_Protocol_Authentication_V1_GenerateSSOTokenRequest.self
            case .SelectGameAccount: return Bgs_Protocol_Authentication_V1_SelectGameAccountRequest.self
            case .VerifyWebCredentials: return Bgs_Protocol_Authentication_V1_VerifyWebCredentialsRequest.self
            case .GenerateWebCredentials: return Bgs_Protocol_Authentication_V1_GenerateWebCredentialsRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.authentication.AuthenticationServer"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

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

extension Bnet_Protocol_Authentication_AuthenticationServer {
    func Logon(request: Bgs_Protocol_Authentication_V1_LogonRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Logon))
    }

    func ModuleNotify(request: Bgs_Protocol_Authentication_V1_ModuleNotification) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ModuleNotify))
    }

    func ModuleMessage(request: Bgs_Protocol_Authentication_V1_ModuleMessageRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ModuleMessage))
    }

    func SelectGameAccount_DEPRECATED(request: Bgs_Protocol_EntityId) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SelectGameAccount_DEPRECATED))
    }

    func GenerateSSOToken(request: Bgs_Protocol_Authentication_V1_GenerateSSOTokenRequest) -> EventLoopFuture<Bgs_Protocol_Authentication_V1_GenerateSSOTokenResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GenerateSSOToken))
    }

    func SelectGameAccount(request: Bgs_Protocol_Authentication_V1_SelectGameAccountRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SelectGameAccount))
    }

    func VerifyWebCredentials(request: Bgs_Protocol_Authentication_V1_VerifyWebCredentialsRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.VerifyWebCredentials))
    }

    func GenerateWebCredentials(request: Bgs_Protocol_Authentication_V1_GenerateWebCredentialsRequest) -> EventLoopFuture<Bgs_Protocol_Authentication_V1_GenerateWebCredentialsResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GenerateWebCredentials))
    }
}
