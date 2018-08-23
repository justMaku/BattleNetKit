//
//  AuthSession.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 22.08.18.
//

import Foundation

struct AuthSession: ClientPacket {
    struct Flags: OptionSet {
        let rawValue: UInt8
        
        static let useIPv6 = Flags.init(rawValue: 1 << 8)
    }
    
    static let opcode = Opcode.CMSG_AUTH_SESSION
    
    let dosReponse: UInt64 = 0
    let region: UInt32
    let battleGroup: UInt32
    let realm: UInt32
    let localChallenge: [UInt8]
    let realmJoinProof: [UInt8]
    let flags: Flags = []
    let realmJoinTicket: [UInt8]
    
    var payload: [UInt8] {
        var bytes =
            dosReponse.bytes +
            region.bytes +
            battleGroup.bytes +
            realm.bytes
        bytes = bytes + localChallenge +
            realmJoinProof +
            flags.rawValue.bytes
        bytes = bytes + UInt32(realmJoinTicket.count).bytes +
            realmJoinTicket
        
        return bytes
    }
}
