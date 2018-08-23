//
//  MultiplePackets.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 23.08.18.
//

import Foundation
import BattleNetKit

struct MultiplePackets: ServerPacket {
    static let opcode = Opcode.SMSG_MULTIPLE_PACKETS
    
    public let underlyingPackets: [ServerPacket]
    
    static func parse(payload: [UInt8]) throws -> MultiplePackets {
        var position = 0
        
        var packets: [ServerPacket] = []
        
        repeat {
            do {
                let length = Int(UInt16(bytes: payload[position..<position+2].array))
                position += 2
                
                let rawOpcode = UInt16(bytes: payload[position..<position+2].array)
                position += 2
                
                if length <= 0 || length > payload.count - position {
                    throw WoWClient.Error.malformedPacket(opcode: MultiplePackets.opcode.rawValue, payload: payload)
                }
                
                let packetPayload = payload[position..<position+length].array
                position += length
                
                guard
                    let opcode = Opcode.init(rawValue: rawOpcode),
                    let implementation = opcode.implementation as? ServerPacket.Type
                    else {
                        throw WoWClient.Error.unknownOpcode(opcode: rawOpcode)
                }
                
                let packet = try implementation.parse(payload: packetPayload)
                packets.append(packet)
            } catch let error as WoWClient.Error {
                switch error {
                case .unknownOpcode(let opcode):
                    Log.warning("Unknown opcode received: \(String(format:"0x%02X", opcode))")
                default:
                    throw error
                }
            }
        } while (position + 3 < payload.count)
        
        return MultiplePackets(underlyingPackets: packets)
    }
}
