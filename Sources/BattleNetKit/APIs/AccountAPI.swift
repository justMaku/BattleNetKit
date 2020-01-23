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
}

extension AccountAPI: Bnet_Protocol_Account_AccountNotifyHandler {
}
