//
//  AuthChallenge.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 10.08.18.
//

import Foundation

struct AuthChallenge: ServerPacket {
    static let opcode = Opcode.SMSG_AUTH_CHALLENGE
    
    public let serverChallenge: [UInt8]

    static func parse(payload: [UInt8]) -> AuthChallenge {
        let serverChallenge = payload[32..<32+16]
        return AuthChallenge(serverChallenge: serverChallenge.array) // TODO: Add proper packet handling.
    }
}
