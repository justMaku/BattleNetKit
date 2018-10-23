//
//  RealmlistDumper.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation
import BattleNetKit
import CryptoSwift

class RealmlistClient: BattleNetDelegate {
    private let client: BattleNet
    private var ticket: Data? = nil
    private var environment: RealmlistAPI.Environment
    
    init(region: Region, token: String, environment: RealmlistAPI.Environment) throws {
        self.client = try BattleNet(region: region, token: token)
        self.environment = environment
        self.client.delegate = self
    }
    
    func connect() throws {
        try self.client.connect()
    }
    
    func client(_ client: BattleNet, didChangeState state: BattleNet.State) throws {
        guard
            state == .connected,
            let account = self.client.authenticationAPI.gameAccounts.last
        else {
            return
        }
        
        try? dumpRealmist(client: client, account: account)
    }
    
    private func dumpRealmist(client: BattleNet, account: EntityId) throws {
        try client.realmlistAPI.requestRealmlist(for: account, environment: self.environment) { realmlist in
            let encoder = JSONEncoder()
            
            let json = try encoder.encode(realmlist)
            
            print(json.string)
            exit(0)
        }
    }
    
    func client(_ client: BattleNet, didEncounterError error: Swift.Error) {
        try! fail(error)
    }
}
