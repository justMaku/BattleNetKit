import Foundation
import NIO

public class AccountAPI: API {
    enum Error: Swift.Error {
        case bindError
    }

    private let clientService: Bnet_Protocol_Account_AccountNotify
    private let serverService: Bnet_Protocol_Account_AccountService

    internal let eventLoop: EventLoop

    required init(
        eventLoop: EventLoop,
        serviceProvider: AuroraServiceProvider,
        messageQueue: AuroraMessageQueue
    ) throws {
        self.eventLoop = eventLoop

        self.serverService = .init(eventLoop: eventLoop, messageQueue: messageQueue)
        self.clientService = .init(eventLoop: eventLoop, messageQueue: messageQueue)

        self.clientService.delegate = self

        try serviceProvider.register(inbound: self.clientService)
        try serviceProvider.register(outbound: self.serverService)
    }

    public func getAccountState(account: Bgs_Protocol_EntityId) -> EventLoopFuture<Bgs_Protocol_Account_V1_AccountState> {
        var request = Bgs_Protocol_Account_V1_GetAccountStateRequest()

        request.entityID = account

        return self.serverService.GetAccountState(request: request).map { $0.state }
    }

    public func getGameAccountState(
        accountID: Bgs_Protocol_EntityId,
        gameAccountID: Bgs_Protocol_EntityId
    ) -> EventLoopFuture<Bgs_Protocol_Account_V1_GameAccountState> {
        var request = Bgs_Protocol_Account_V1_GetGameAccountStateRequest()

        request.accountID = accountID
        request.gameAccountID = gameAccountID
        request.options = .init()
        request.options.allFields = true

        return self.serverService
            .GetGameAccountState(request: request).map { $0.state }
    }

    public func getAuthorizedData(accountID: Bgs_Protocol_EntityId) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetAuthorizedDataResponse> {
        var request = Bgs_Protocol_Account_V1_GetAuthorizedDataRequest()
        request.entityID = accountID

        return self.serverService.GetAuthorizedData(request: request)
    }

    public func getLicenses(accountID: Bgs_Protocol_EntityId) -> EventLoopFuture<Bgs_Protocol_Account_V1_GetLicensesResponse> {
        var request = Bgs_Protocol_Account_V1_GetLicensesRequest()

        request.excludeUnknownProgram = false
        request.fetchAccountLicenses = true
        request.fetchGameAccountLicenses = true
        request.fetchDynamicAccountLicenses = true
        request.targetID = accountID

        return self.serverService.GetLicenses(request: request)
    }
}

extension AccountAPI: Bnet_Protocol_Account_AccountNotifyHandler {
}
