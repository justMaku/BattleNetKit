//
//  RealmlistDumper.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation
import BattleNetKit

class BattleNetRealmlistDumper: BattleNetDelegate {
    
    enum Error: Swift.Error {
        case noTicket
    }
    
    private let client: BattleNet
    private var ticket: Data? = nil
    
    init(region: Region, token: String) throws {
        self.client = try BattleNet(region: region, token: token)
        self.client.delegate = self
    }
    
    func connect() throws {
        try self.client.connect()
    }
    
    func client(_ client: BattleNet, didChangeState state: BattleNet.State) throws {
        guard
            state == .connected,
            let account = self.client.authenticationAPI.gameAccounts.first
            else {
                return
        }
        
        try self.client.realmlistAPI.requestRealmlist(for: account) { realmlist in
            let encoder = JSONEncoder()
            
            let json = try encoder.encode(realmlist)
            
            print(json.string)
            exit(0)
        }
    }
}
