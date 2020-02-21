import Foundation
import NIO

public class AuthenticationAPI: API {
    enum Error: Swift.Error {
        case externalChallengeRequired
        case loginActionCancelled
    }

    private let clientService: Bnet_Protocol_Authentication_AuthenticationClient
    private let serverService: Bnet_Protocol_Authentication_AuthenticationServer

    private let challangeService: Bnet_Protocol_Challenge_ChallengeNotify
    private var loginPromise: EventLoopPromise<Bgs_Protocol_Authentication_V1_LogonResult>? = nil {
        didSet {
            oldValue?.fail(Error.loginActionCancelled)
        }
    }

    internal let eventLoop: EventLoop

    init(eventLoop: EventLoop, serviceProvider: AuroraServiceProvider, messageQueue: AuroraMessageQueue) throws {
        self.eventLoop = eventLoop

        self.clientService = .init(eventLoop: eventLoop, messageQueue: messageQueue)
        self.serverService = .init(eventLoop: eventLoop, messageQueue: messageQueue)
        self.challangeService = .init(eventLoop: eventLoop, messageQueue: messageQueue)

        self.clientService.delegate = self
        self.challangeService.delegate = self

        try serviceProvider.register(inbound: self.clientService)
        try serviceProvider.register(outbound: self.serverService)
        try serviceProvider.register(inbound: self.challangeService)
    }

    // TODO: Figure out whether it makes sense to paste Environment here.
    public func login(token: String, environment: Environment = .live) -> EventLoopFuture<Bgs_Protocol_Authentication_V1_LogonResult> {
        var logonRequest = Bgs_Protocol_Authentication_V1_LogonRequest()
        let loginPromise = self.eventLoop.makePromise(of: Bgs_Protocol_Authentication_V1_LogonResult.self)

        logonRequest.program = Constants.auroraClientName
        logonRequest.locale = Constants.localeName
        logonRequest.platform = Constants.platformName
        logonRequest.version = Constants.auroraClientVersion
        logonRequest.applicationVersion = Int32(environment.clientVersion.versionBuild)
        logonRequest.publicComputer = false
        logonRequest.allowLogonQueueNotifications = true
        logonRequest.cachedWebCredentials = token.data(using: .ascii)!

        self.loginPromise = loginPromise

        return self.serverService.Logon(request: logonRequest).flatMap { _ in
            return loginPromise.futureResult
        }
    }
}

extension AuthenticationAPI: Bnet_Protocol_Authentication_AuthenticationClientHandler {
    func OnLogonComplete(request: Bgs_Protocol_Authentication_V1_LogonResult) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.loginPromise?.succeed(request)

        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnLogonUpdate(request: Bgs_Protocol_Authentication_V1_LogonUpdateRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnLogonQueueUpdate(request: Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnLogonQueueEnd() -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }
}

extension AuthenticationAPI: Bnet_Protocol_Challenge_ChallengeNotifyHandler {
    func OnExternalChallenge(request: Bgs_Protocol_Challenge_V1_ChallengeExternalRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.loginPromise?.fail(Error.externalChallengeRequired)

        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }
}
