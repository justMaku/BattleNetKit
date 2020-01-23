import Foundation
import NIO

public class ConnectionAPI: API {
    enum Error: Swift.Error {
        case bindError
    }

    private let connectionService: Bnet_Protocol_Connection_ConnectionService
    internal let eventLoop: EventLoop

    required init(eventLoop: EventLoop, serviceProvider: AuroraServiceProvider, messageQueue: AuroraMessageQueue) throws {
        self.eventLoop = eventLoop

        self.connectionService = .init(eventLoop: eventLoop, messageQueue: messageQueue)
        self.connectionService.delegate = self

        try serviceProvider.register(inbound: self.connectionService)
        try serviceProvider.register(outbound: self.connectionService)
    }
}

// MARK: - Outgoing Message Calls

public extension ConnectionAPI {
    internal func connect() -> EventLoopFuture<()> {
        var connectionRequest = Bgs_Protocol_Connection_V1_ConnectRequest()

        connectionRequest.useBindlessRpc = true

        return connectionService.Connect(request: connectionRequest).flatMapResult {
            (response) -> Result<(), Error> in

            if response.bindResult == 0 {
                return .success(())
            } else {
                return .failure(Error.bindError)
            }
        }
    }
}

// MARK: - Incoming Message Handlers

extension ConnectionAPI: Bnet_Protocol_Connection_ConnectionServiceHandler {}
