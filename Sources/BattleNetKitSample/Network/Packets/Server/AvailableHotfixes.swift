//
//  AvailableHotfixes.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 23.08.18.
//

import Foundation

struct AvailableHotfixes: ServerPacket {
    typealias Hotfix = (table: UInt32, row: UInt32)
    
    static let opcode = Opcode.SMSG_AVAILABLE_HOTFIXES
    
    let cacheVersion: UInt32
    let hotfixes: [Hotfix]
    
    static func parse(payload: [UInt8]) -> AvailableHotfixes {
        var position = 0
        let version = UInt32(bytes: payload[position..<position+4].array)

        position += 4
        let count = UInt32(bytes: payload[position..<position+4].array)
        
        var hotfixes: [Hotfix] = []
        for i in 0..<count {
            var table = UInt32(bytes: payload[position..<position+4].array)
            position += 4
            
            var row = UInt32(bytes: payload[position..<position+4].array)
            position += 4
            
            hotfixes.append((table: table, row: row))
        }
        
        return AvailableHotfixes(cacheVersion: version, hotfixes: hotfixes)
    }
}
