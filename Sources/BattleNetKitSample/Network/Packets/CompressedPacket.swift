//
//  CompressedPacket.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 22.08.18.
//

import Foundation

struct CompressedPacket: ServerPacket {
    static func parse(payload: [UInt8]) -> CompressedPacket {
        
        let compressedPayload = payload[12..<payload.count].array
        
        let uncompressedSize = UInt32(bytes: payload[0..<4].array)
        let uncompressedPayload = Compression.default.inflate(data: compressedPayload, expectedSize: uncompressedSize)

        let underlyingRawOpcode = UInt16(bytes: uncompressedPayload[0..<2].array)
        print("Underlying raw opcode: \(String(format:"0x%02X", underlyingRawOpcode))")
        let opcode = Opcode.init(rawValue: underlyingRawOpcode) ?? Opcode.UNKNOWN
        let underlyingPacketPayload = uncompressedPayload[2..<uncompressedPayload.count].array
        let packet = (opcode.implementation as? ServerPacket.Type)?.parse(payload: underlyingPacketPayload) ?? UnknownPacket(opcode: opcode, payload: underlyingPacketPayload)

        return CompressedPacket(
            uncompressedSize: uncompressedSize,
            uncompressedAdler: UInt32(bytes: payload[4..<8].array),
            compressedAdler: 0,
            underlyingPacket: packet)
    }
    
    let uncompressedSize: UInt32
    let uncompressedAdler: UInt32
    let compressedAdler: UInt32
    let underlyingPacket: ServerPacket
    
    let opcode: Opcode = Opcode.SMSG_COMPRESSED_PACKET
    
    var payload: [UInt8] {
        return []
    }
}
