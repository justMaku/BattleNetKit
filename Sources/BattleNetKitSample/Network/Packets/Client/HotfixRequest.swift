//
//  HotfixRequest.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 23.08.18.
//

import Foundation

struct HotfixRequest: ClientPacket {
    static let opcode = Opcode.CMSG_HOTFIX_REQUEST
    
    let hotfixes: [UInt64]
    
    var payload: [UInt8] {
        return self.hotfixes.count.bytes + self.hotfixes.map { $0.bytes }.joined().array
    }
}
