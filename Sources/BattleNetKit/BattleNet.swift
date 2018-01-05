//
//  Region.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation


public protocol BattleNetDelegate {
    func client(_ client: BattleNet, didChangeState to: BattleNet.State)
}

public class BattleNet {
    
    public enum State {
        case disconnected
        case connecting
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
    fileprivate (set) var state: State = .disconnected {
        didSet {
            self.delegate?.client(self, didChangeState: state)
        }
    }
    
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
        self.state = .connected
        Log.debug("Authenticated as: \(username)", domain: .client)
    }
}
