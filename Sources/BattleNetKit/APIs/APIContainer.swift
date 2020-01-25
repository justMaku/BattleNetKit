import Foundation
import NIO

public struct APIContainer {
    public let connection: ConnectionAPI
    public let authentication: AuthenticationAPI
    public let utilities: GameUtilitiesAPI
    public let account: AccountAPI
    public let realmlist: RealmlistAPI

    init(
        eventLoop: EventLoop,
        serviceProvider: AuroraServiceProvider,
        messageQueue: AuroraMessageQueue
    ) throws {
        self.connection = try .init(
            eventLoop: eventLoop,
            serviceProvider: serviceProvider,
            messageQueue: messageQueue
        )

        self.authentication = try .init(
            eventLoop: eventLoop,
            serviceProvider: serviceProvider,
            messageQueue: messageQueue
        )

        let gameUtilities = try GameUtilitiesAPI(
            eventLoop: eventLoop,
            serviceProvider: serviceProvider,
            messageQueue: messageQueue
        )

        self.account = try .init(
            eventLoop: eventLoop,
            serviceProvider: serviceProvider,
            messageQueue: messageQueue
        )

        self.utilities = gameUtilities
        self.realmlist = .init(
            eventLoop: eventLoop,
            gameUtilitiesAPI: gameUtilities
        )
    }
}
