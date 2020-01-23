import Foundation
import NIO

enum Constants {
    public static let auroraClientName = "WoW"
    public static let auroraClientVersion = "Battle.net Game Service SDK v1.11.5 \"1b75249ba9\"/224 (Oct 22 2018 09:29:50)"
    public static let auroraAttributeVersion = "classic1"
    public static let gameClientName = "WoW"
    public static let localeName = "enUS"
    public static let platformType = "Mac"
    public static let platformName = "Mc64"
    public static let clientArchitecture = "x64"
    public static let systemArchitecture = "x64"
    public static let systemVersion = "OS X 10.14"
    public static let buildVariant = "darwin-x86_64-clang-release"

    public static let clientVersion = JamJSONGameVersion(versionMajor: 1, versionMinor: 13, versionRevision: 0, versionBuild: 28211)
}

public class AuthenticationAPI: API {
    private let clientService: Bnet_Protocol_Authentication_AuthenticationClient
    private let serverService: Bnet_Protocol_Authentication_AuthenticationServer

    private let challangeService: Bnet_Protocol_Challenge_ChallengeNotify

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

    public func login(token: String) -> EventLoopFuture<()> {
        var logonRequest = Bgs_Protocol_Authentication_V1_LogonRequest()

        logonRequest.program = Constants.auroraClientName
        logonRequest.locale = Constants.localeName
        logonRequest.platform = Constants.platformName
        logonRequest.version = Constants.auroraClientVersion
        logonRequest.applicationVersion = Int32(Constants.clientVersion.versionBuild)
        logonRequest.publicComputer = false
        logonRequest.allowLogonQueueNotifications = true
        logonRequest.cachedWebCredentials = token.data(using: .ascii)!

        return self.serverService.Logon(request: logonRequest).map { _ in return () }
    }
}

extension AuthenticationAPI: Bnet_Protocol_Authentication_AuthenticationClientHandler {
    func OnLogonQueueUpdate(request: Bgs_Protocol_Authentication_V1_LogonQueueUpdateRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        print(request)
        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnModuleLoad(request: Bgs_Protocol_Authentication_V1_ModuleLoadRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        fatalError("NIY")
    }

    func OnModuleMessage(request: Bgs_Protocol_Authentication_V1_ModuleMessageRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        fatalError("NIY")
    }

    func OnServerStateChange(request: Bgs_Protocol_Authentication_V1_ServerStateChangeRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        fatalError("NIY")
    }

    func OnLogonComplete(request: Bgs_Protocol_Authentication_V1_LogonResult) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        print(request)

        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnMemModuleLoad(request: Bgs_Protocol_Authentication_V1_MemModuleLoadRequest) -> EventLoopFuture<Bgs_Protocol_Authentication_V1_MemModuleLoadResponse> {
        fatalError("NIY")
    }

    func OnLogonUpdate(request: Bgs_Protocol_Authentication_V1_LogonUpdateRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnVersionInfoUpdated(request: Bgs_Protocol_Authentication_V1_VersionInfoNotification) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        fatalError("NIY")
    }

    func OnLogonQueueEnd() -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnGameAccountSelected(request: Bgs_Protocol_Authentication_V1_GameAccountSelectedRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        fatalError("NIY")
    }
}

extension AuthenticationAPI: Bnet_Protocol_Challenge_ChallengeNotifyHandler {
    func OnExternalChallenge(request: Bgs_Protocol_Challenge_V1_ChallengeExternalRequest) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        print(request)
        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }

    func OnExternalChallengeResult(request: Bgs_Protocol_Challenge_V1_ChallengeExternalResult) -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        print(request)
        return self.eventLoop.makeSucceededFuture(Bgs_Protocol_NO_RESPONSE())
    }
}
