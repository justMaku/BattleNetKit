//
//  AcknowledgeEncryption.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 22.08.18.
//

import Foundation

struct AcknowledgeEncryption: ClientPacket {
    static let opcode = Opcode.CMSG_ENABLE_ENCRYPTION_ACK
    
    var payload: [UInt8] {
        return []
    }
}
