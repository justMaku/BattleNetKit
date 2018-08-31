//
//  CompressedPacket.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 23.08.18.
//

import Foundation

struct CompressedPacket: ServerPacket {
    static let opcode = Opcode.SMSG_COMPRESSED_PACKET
    
    public let underlyingPacket: ServerPacket
    
    static func parse(payload: [UInt8]) throws -> CompressedPacket {
        let compressedPayload = payload[12..<payload.count].array
        
        let uncompressedSize = UInt32(bytes: payload[0..<4].array)
        let uncompressedPayload = Compression.default.inflate(data: compressedPayload, expectedSize: uncompressedSize)
        
        let underlyingRawOpcode = UInt16(bytes: uncompressedPayload[0..<2].array)
        
        guard
            let opcode = Opcode.init(rawValue: underlyingRawOpcode),
            let implementation = opcode.implementation as? ServerPacket.Type
            else {
                throw WoWClient.Error.unknownOpcode(opcode: underlyingRawOpcode)
        }
        
        try Data(compressedPayload).write(to: .init(fileURLWithPath: "/Users/maku/Desktop/malformed.bin"))
        
        let underlyingPacketPayload = uncompressedPayload[2..<uncompressedPayload.count].array
        let packet = try implementation.parse(payload: underlyingPacketPayload)
        
        return CompressedPacket(underlyingPacket: packet)
    }
}
