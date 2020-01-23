import Foundation
import NIO

public class GameServicesAPI: API {
    enum Error: Swift.Error {
        case bindError
    }

    private let gameUtilitiesService: Bnet_Protocol_GameUtilities_GameUtilities
    internal let eventLoop: EventLoop

    required init(eventLoop: EventLoop, serviceProvider: AuroraServiceProvider, messageQueue: AuroraMessageQueue) throws {
        self.eventLoop = eventLoop

        self.gameUtilitiesService = .init(eventLoop: eventLoop, messageQueue: messageQueue)
        self.gameUtilitiesService.delegate = self

        try serviceProvider.register(inbound: self.gameUtilitiesService)
        try serviceProvider.register(outbound: self.gameUtilitiesService)
    }
}

extension GameServicesAPI: Bnet_Protocol_GameUtilities_GameUtilitiesHandler {
}
