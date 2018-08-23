//
//  AuthResponse.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 22.08.18.
//

import Foundation

struct AuthResponse: ServerPacket {
    enum Result {
        
    }
    
    static let opcode = Opcode.SMSG_AUTH_RESPONSE

    public let result: UInt32

    static func parse(payload: [UInt8]) -> AuthResponse {
        let result = payload[0..<4]
        return AuthResponse(result: UInt32(bytes: result.array)) // TODO: Add proper packet handling.
    }
}
