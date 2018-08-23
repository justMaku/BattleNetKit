//
//  EnableEncryption.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 22.08.18.
//

import Foundation

struct EnableEncryption: ServerPacket {
    static let opcode = Opcode.SMSG_ENABLE_ENCRYPTION

    static func parse(payload: [UInt8]) -> EnableEncryption {
        return EnableEncryption()
    }    
}
