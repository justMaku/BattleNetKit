//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation


public protocol BattleNetDelegate {
    func client(_ client: BattleNet, didChangeState: BattleNet.State) throws
    func client(_ client: BattleNet, didEncounterError: Error)
}

public class BattleNet {
    
    public enum State {
        case disconnected
        case connecting
        case binding
        case bound
        case authenticating
        case initializing
        case connected
    }
    
    public let region: Region
    public var delegate: BattleNetDelegate?
    
    //MARK: - APIs
    private (set) public var connectionAPI: ConnectionAPI! = nil
    private (set) public var authenticationAPI: AuthenticationAPI! = nil
    private (set) public var gamesUtilitiesAPI: GamesUtilitiesAPI! = nil
    private (set) public var realmlistAPI: RealmlistAPI! = nil

    internal let connection: Connection
    
    fileprivate let token: String
    fileprivate var apis: [API] = []
    
    private (set) var state: State = .disconnected
    
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
        try self.update(state: .connecting)
        try connectionAPI.connect()
    }
    
    fileprivate func update(state: State) throws {
        self.state = state
        try self.delegate?.client(self, didChangeState: state)
    }
}

extension BattleNet: ConnectionAPIDelegate {
    func connected(to: Region) throws {
        try self.update(state: .binding)
        try apis.forEach { try $0.bind(to: self.connectionAPI) }
    }
    
    func bound(to: Region) throws {
        try self.update(state: .bound)
        try apis.forEach { try $0.register(with: self.connectionAPI) }
        
        try self.authenticationAPI.login(token: token)
    }
    
    func disconnected(from: Region) throws {
        try self.update(state: .disconnected)
    }
    
    func failed(with error: Error) throws {
        self.delegate?.client(self, didEncounterError: error)
        try self.update(state: .disconnected)
    }
}

extension BattleNet: AuthenticationAPIDelegate {
    func authenticated(as username: String) throws {
        try self.update(state: .connected)
        Log.debug("Authenticated as: \(username)", domain: .client)
    }
}
