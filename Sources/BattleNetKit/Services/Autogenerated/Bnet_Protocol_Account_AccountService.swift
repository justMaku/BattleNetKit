import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Account_AccountService: ServiceType {
    enum Method: Int, MethodType {
        case ResolveAccount = 13
        case IsIgrAddress = 15
        case Subscribe = 25
        case Unsubscribe = 26
        case GetAccountState = 30
        case GetGameAccountState = 31
        case GetLicenses = 32
        case GetGameTimeRemainingInfo = 33
        case GetGameSessionInfo = 34
        case GetCAISInfo = 35
        case GetAuthorizedData = 37
        case GetSignedAccountState = 44

        var name: String {
            switch self {
            case .ResolveAccount: return "ResolveAccount"
            case .IsIgrAddress: return "IsIgrAddress"
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .GetAccountState: return "GetAccountState"
            case .GetGameAccountState: return "GetGameAccountState"
            case .GetLicenses: return "GetLicenses"
            case .GetGameTimeRemainingInfo: return "GetGameTimeRemainingInfo"
            case .GetGameSessionInfo: return "GetGameSessionInfo"
            case .GetCAISInfo: return "GetCAISInfo"
            case .GetAuthorizedData: return "GetAuthorizedData"
            case .GetSignedAccountState: return "GetSignedAccountState"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .ResolveAccount: return Bgs_Protocol_Account_V1_ResolveAccountResponse.self
            case .IsIgrAddress: return Bgs_Protocol_NoData.self
            case .Subscribe: return Bgs_Protocol_Account_V1_SubscriptionUpdateResponse.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .GetAccountState: return Bgs_Protocol_Account_V1_GetAccountStateResponse.self
            case .GetGameAccountState: return Bgs_Protocol_Account_V1_GetGameAccountStateResponse.self
            case .GetLicenses: return Bgs_Protocol_Account_V1_GetLicensesResponse.self
            case .GetGameTimeRemainingInfo: return Bgs_Protocol_Account_V1_GetGameTimeRemainingInfoResponse.self
            case .GetGameSessionInfo: return Bgs_Protocol_Account_V1_GetGameSessionInfoResponse.self
            case .GetCAISInfo: return Bgs_Protocol_Account_V1_GetCAISInfoResponse.self
            case .GetAuthorizedData: return Bgs_Protocol_Account_V1_GetAuthorizedDataResponse.self
            case .GetSignedAccountState: return Bgs_Protocol_Account_V1_GetSignedAccountStateResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .ResolveAccount: return Bgs_Protocol_Account_V1_ResolveAccountRequest.self
            case .IsIgrAddress: return Bgs_Protocol_Account_V1_IsIgrAddressRequest.self
            case .Subscribe: return Bgs_Protocol_Account_V1_SubscriptionUpdateRequest.self
            case .Unsubscribe: return Bgs_Protocol_Account_V1_SubscriptionUpdateRequest.self
            case .GetAccountState: return Bgs_Protocol_Account_V1_GetAccountStateRequest.self
            case .GetGameAccountState: return Bgs_Protocol_Account_V1_GetGameAccountStateRequest.self
            case .GetLicenses: return Bgs_Protocol_Account_V1_GetLicensesRequest.self
            case .GetGameTimeRemainingInfo: return Bgs_Protocol_Account_V1_GetGameTimeRemainingInfoRequest.self
            case .GetGameSessionInfo: return Bgs_Protocol_Account_V1_GetGameSessionInfoRequest.self
            case .GetCAISInfo: return Bgs_Protocol_Account_V1_GetCAISInfoRequest.self
            case .GetAuthorizedData: return Bgs_Protocol_Account_V1_GetAuthorizedDataRequest.self
            case .GetSignedAccountState: return Bgs_Protocol_Account_V1_GetSignedAccountStateRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.account.AccountService"

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

extension Bnet_Protocol_Account_AccountService {
    func ResolveAccount(request: Bgs_Protocol_Account_V1_ResolveAccountRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_ResolveAccountResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.ResolveAccount))
    }

    func IsIgrAddress(request: Bgs_Protocol_Account_V1_IsIgrAddressRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.IsIgrAddress))
    }

    func Subscribe(request: Bgs_Protocol_Account_V1_SubscriptionUpdateRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_SubscriptionUpdateResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Subscribe))
    }

    func Unsubscribe(request: Bgs_Protocol_Account_V1_SubscriptionUpdateRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.Unsubscribe))
    }

    func GetAccountState(request: Bgs_Protocol_Account_V1_GetAccountStateRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetAccountStateResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetAccountState))
    }

    func GetGameAccountState(request: Bgs_Protocol_Account_V1_GetGameAccountStateRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetGameAccountStateResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetGameAccountState))
    }

    func GetLicenses(request: Bgs_Protocol_Account_V1_GetLicensesRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetLicensesResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetLicenses))
    }

    func GetGameTimeRemainingInfo(request: Bgs_Protocol_Account_V1_GetGameTimeRemainingInfoRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetGameTimeRemainingInfoResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetGameTimeRemainingInfo))
    }

    func GetGameSessionInfo(request: Bgs_Protocol_Account_V1_GetGameSessionInfoRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetGameSessionInfoResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetGameSessionInfo))
    }

    func GetCAISInfo(request: Bgs_Protocol_Account_V1_GetCAISInfoRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetCAISInfoResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetCAISInfo))
    }

    func GetAuthorizedData(request: Bgs_Protocol_Account_V1_GetAuthorizedDataRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetAuthorizedDataResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetAuthorizedData))
    }

    func GetSignedAccountState(request: Bgs_Protocol_Account_V1_GetSignedAccountStateRequest) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetSignedAccountStateResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetSignedAccountState))
    }
}
