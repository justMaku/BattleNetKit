//
//  EnumCharacters.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 23.08.18.
//

import Foundation

struct EnumCharacters: ClientPacket {
    static let opcode = Opcode.CMSG_ENUM_CHARACTERS
    
    var payload: [UInt8] {
        return []
    }
}
