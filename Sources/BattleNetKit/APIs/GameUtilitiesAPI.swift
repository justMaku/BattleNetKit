import Foundation
import NIO

public class GameUtilitiesAPI: API {
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

    func send(_ request: Bgs_Protocol_GameUtilities_V1_ClientRequest) -> EventLoopFuture<Bgs_Protocol_GameUtilities_V1_ClientResponse> {
        return self.gameUtilitiesService.ProcessClientRequest(request: request)
    }

    func getAllValues(for attribute: Bgs_Protocol_Attribute) -> EventLoopFuture<[Bgs_Protocol_Variant]> {
        var request = Bgs_Protocol_GameUtilities_V1_GetAllValuesForAttributeRequest()
        request.attributeKey = attribute.name

        return self.gameUtilitiesService.GetAllValuesForAttribute(request: request).map { $0.attributeValue }
    }
}

extension GameUtilitiesAPI: Bnet_Protocol_GameUtilities_GameUtilitiesHandler {
}
