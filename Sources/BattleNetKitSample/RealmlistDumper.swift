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
    
    enum Error: Swift.Error {
        case noRegion
        case noRealm
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
            let account = self.client.authenticationAPI.gameAccounts.last
        else {
            return
        }
        
        let realmlistAPI = self.client.realmlistAPI!
        let secret = AES.randomIV(32)
        
        try realmlistAPI.requestRealmlistTicket(gameAccount: account, clientSecret: secret) { ticket in
            
            try realmlistAPI.requestSubRegions() { regions in
                guard let region = regions.first else {
                    return
                }
                
                try realmlistAPI.requestRealmList(in: region, with: ticket) { realms in
                    
                    let random = arc4random_uniform(UInt32(realms.count - 1))
                    let realm = realms[0]
                    
                    try realmlistAPI.requestRealmJoin(for: realm, in: region, with: ticket) { result in
                        let info = try result.dematerialize()
                        let client = try WoWClient(realm: realm, joinInfo: info, secret: secret)
                        
                        try client.connect()
                        try client.run()
                    }
                }
            }
        }
    }
    
    func client(_ client: BattleNet, didEncounterError error: Swift.Error) {
        Log.error(error.localizedDescription)
    }
}
