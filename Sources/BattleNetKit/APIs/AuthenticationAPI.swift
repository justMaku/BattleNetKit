//
//  AuthenticationAPI.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.12.17.
//

import Foundation

protocol AuthenticationAPIDelegate {
    func authenticated(as username: String) throws
}

public class AuthenticationAPI: API {
    let clientService: AuthenticationClientService = .init()
    let serverService: AuthenticationServerService = .init()
    let challengeService: ChallengeNotifyService = .init()
    let accountService: AccountService = .init()
    let accountNotify: AccountNotifyService = .init()
    
    let client: BattleNet
    
    private (set) public var gameAccounts: [EntityId] = []
    var bnetAccount: EntityId? = nil
    var sessionKey: Data? = nil
    
    var delegate: AuthenticationAPIDelegate? = nil
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {
        connectionAPI.bind(exportedService: clientService)
        connectionAPI.bind(importedService: serverService)

        connectionAPI.bind(exportedService: challengeService)
        connectionAPI.bind(exportedService: accountNotify)
        
        connectionAPI.bind(importedService: accountService)
    }
    
    func register(with connectionAPI: ConnectionAPI) throws {
        guard let clientServiceId = clientService.id else {
            throw ServiceTypeError.cantRegisterUnboundService
        }
        
        connectionAPI.register(.init(service: clientServiceId, method: AuthenticationClientService.Method.logonComplete.id, closure: handleLogonComplete))
        connectionAPI.register(.init(service: challengeService.id!, method: ChallengeNotifyService.Method.onExternalChallenge.id, closure: handleExternalChallenge))
    }
    
    func login(token: String) throws {
        Log.debug("Attempting authentication", domain: .authentication)
        var logonRequest = LogonRequest()
        logonRequest.program = Constants.auroraClientName
        logonRequest.locale = Constants.localeName
        logonRequest.platform = Constants.platformName
        logonRequest.version = "0"
        logonRequest.applicationVersion = 1
        logonRequest.publicComputer = false
        logonRequest.allowLogonQueueNotifications = true
        logonRequest.webClientVerification = true
        
        if let tokenData = token.data(using: .ascii) {
            logonRequest.cachedWebCredentials = tokenData
        }
        
        try client.connectionAPI.call(AuthenticationServerService.Method.logon, message: logonRequest)
    }
    
    func handleExternalChallenge(packet: Packet) throws {
        let response: ChallengeExternalRequest = try packet.extract()
        let url = response.payload.string
        Log.warning("External challange requested with url: \(url)", domain: .authentication)
    }
    
    func handleLogonComplete(packet: Packet) throws {
        let response: LogonResult = try packet.extract()
        
        self.bnetAccount = response.account
        self.gameAccounts = response.gameAccount
        self.sessionKey = response.sessionKey
        
        Log.debug("Authentication complete", domain: .authentication)
        
        try self.delegate?.authenticated(as: response.battleTag)
    }
    
    public func generateSSOToken(for program: String) throws {
        var request = GenerateSSOTokenRequest()
        request.program = program.fourCC()
        
        
        try client.connectionAPI.call(AuthenticationServerService.Method.generateSSOToken, message: request) { (result) in
            let response = try result.dematerialize().extract() as GenerateSSOTokenResponse
            let id = response.ssoID.string
            let secret = response.ssoSecret.string
        }
    }
    
    public func generateWebCredentials(for program: String) throws {
        var request = GenerateWebCredentialsRequest()
        request.program = program.fourCC()
        
        try client.connectionAPI.call(AuthenticationServerService.Method.generateWebCredentials, message: request) { (result) in
            let response = try result.dematerialize().extract() as GenerateWebCredentialsResponse
            let id = response.webCredentials.string
        }
    }

    public func getAccountState() throws {
        var request = GetAccountStateRequest()
        request.entityID = self.bnetAccount!

        var accountFieldOptions = AccountFieldOptions()
        accountFieldOptions.allFields = true
        
        request.options = accountFieldOptions

        try client.connectionAPI.call(AccountService.Method.getAccountState, message: request) { (result) in
            let response = try result.dematerialize().extract() as GetAccountStateResponse
        }
    }
}
