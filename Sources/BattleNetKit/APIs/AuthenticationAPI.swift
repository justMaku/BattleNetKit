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
    let client: BattleNet
    
    var gameAccounts: [EntityId] = []
    var bnetAccount: EntityId? = nil
    var sessionKey: Data? = nil
    
    var delegate: AuthenticationAPIDelegate? = nil
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {
        connectionAPI.bind(exportedService: clientService)
        connectionAPI.bind(importedService: serverService)
    }
    
    func register(with connectionAPI: ConnectionAPI) throws {
        guard let clientServiceId = clientService.id else {
            throw ServiceTypeError.cantRegisterUnboundService
        }
        
        connectionAPI.register(.init(service: clientServiceId, method: AuthenticationClientService.Method.logonComplete.id, closure: handleLogonComplete))
    }
    
    func login(token: String) throws {
        Log.debug("Attempting authentication", domain: .authentication)
        var logonRequest = LogonRequest()
        logonRequest.program = Constants.clientTypeName
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
    
    
    func handleLogonComplete(packet: Packet) throws {
        let response: LogonResult = try packet.extract()
        
        self.bnetAccount = response.account
        self.gameAccounts = response.gameAccount
        self.sessionKey = response.sessionKey
        
        Log.debug("Authentication complete", domain: .authentication)
        
        try self.delegate?.authenticated(as: response.battleTag)
    }
}
