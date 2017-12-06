//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation

final public class BattleNet {
    enum State {
        case disconnected
        case connecting
        case bound
        case authenticating
        case initializing
        case connected
    }
    
    let region: Region
    var state: State = .disconnected
    
    //MARK: - APIs
    public var connectionAPI: ConnectionAPI! = nil
    public var authenticationAPI: AuthenticationAPI! = nil
    public var gamesUtilitiesAPI: GamesUtilitiesAPI! = nil
    public var realmlistAPI: RealmlistAPI! = nil

    internal let connection: Connection
    internal let token: String
    
    var apis: [API] = []
    
    public init(region: Region, token: String) throws {
        self.region = region
        self.token = token
        
        self.connection = try Connection(region: region)
        
        // Initialize APIs
        self.connectionAPI = ConnectionAPI(client: self)
        self.authenticationAPI = AuthenticationAPI(client: self)
        self.gamesUtilitiesAPI = GamesUtilitiesAPI(client: self)
        self.realmlistAPI = RealmlistAPI(client: self)

        self.apis = [connectionAPI, authenticationAPI, gamesUtilitiesAPI, realmlistAPI]
        
        self.connectionAPI.delegate = self
        self.authenticationAPI.delegate = self
    }
    
    public func connect() throws {
        self.state = .connecting
        try connectionAPI.connect()
    }
}

extension BattleNet: ConnectionAPIDelegate {
    func connected(to: Region) throws {
        self.state = .connected
        try apis.forEach { try $0.bind(to: self.connectionAPI) }
    }
    
    func bound(to: Region) throws {
        self.state = .bound
        try apis.forEach { try $0.register(with: self.connectionAPI) }
        
        try self.authenticationAPI.login(token: token)
    }
    
    func disconnected(from: Region) throws {
        self.state = .disconnected
    }
    
    func failed(with: Error) throws {
        self.state = .disconnected
    }
}

extension BattleNet: AuthenticationAPIDelegate {
    func authenticated(as username: String) throws {
        Log.debug("Authenticated as: \(username)", domain: .client)
        
        try self.realmlistAPI.requestRealmlistTicket(gameAccount: self.authenticationAPI.gameAccounts.first!)
    }
}
