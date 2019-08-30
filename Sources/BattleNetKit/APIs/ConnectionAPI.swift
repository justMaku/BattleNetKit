import Foundation
import NIO

public class ConnectionAPI: API {
    enum Error: Swift.Error {
        case bindError
    }

    private let connectionService: Bnet_Protocol_Connection_ConnectionService

    let importedServices: [ServiceType] = [
        Bnet_Protocol_Authentication_AuthenticationServer(),
        Bnet_Protocol_Account_AccountService(),
        Bnet_Protocol_GameUtilities_GameUtilities(),
    ]

    let exportedServices: [ServiceType] = [
        Bnet_Protocol_Authentication_AuthenticationClient(),
        Bnet_Protocol_Challenge_ChallengeNotify(),
        Bnet_Protocol_Account_AccountNotify(),
    ]

    required init(messageQueue: AuroraMessageQueue, serviceProvider _: AuroraServiceProvider) {
        connectionService = .init(messageQueue: messageQueue)
    }

    func bind(to _: ConnectionAPI) throws {}

    func register(with _: ConnectionAPI) throws {}
}

// MARK: - Outgoing Message Calls

public extension ConnectionAPI {
    internal func connect() throws -> EventLoopFuture<()> {
        var connectionRequest = Bgs_Protocol_Connection_V1_ConnectRequest()
        var bindRequest = Bgs_Protocol_Connection_V1_BindRequest()

        let exportedServices = [self.connectionService] + self.exportedServices
        let importedServices = [self.connectionService] + self.importedServices

        (self.exportedServices + self.importedServices).enumerated().forEach { arg in
            var (index, service) = arg
            service.id = UInt32(index) + 1
        }

        bindRequest.exportedService = try exportedServices.map { service in
            var boundService = Bgs_Protocol_Connection_V1_BoundService()
            boundService.id = service.id ?? 0

            boundService.hash = try type(of: service).hash()

            return boundService
        }

        bindRequest.importedService = try importedServices.map { service in
            var boundService = Bgs_Protocol_Connection_V1_BoundService()
            boundService.id = service.id ?? 0
            boundService.hash = try type(of: service).hash()

            return boundService
        }

        connectionRequest.bindRequest = bindRequest
        connectionRequest.useBindlessRpc = false

        return connectionService.connect(request: connectionRequest).flatMapResult {
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

private extension ConnectionAPI {
    private func echo(
        request: Bgs_Protocol_Connection_V1_EchoRequest,
        promise: EventLoopPromise<Bgs_Protocol_Connection_V1_EchoResponse>
    ) {
        var response = Bgs_Protocol_Connection_V1_EchoResponse()
        response.time = request.time
        response.payload = request.payload

        promise.succeed(response)
    }
}
