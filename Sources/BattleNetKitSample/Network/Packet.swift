//
//  Packet.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation

enum PacketGroup {
    
}

protocol Packet: CustomStringConvertible {
    static var opcode: Opcode { get }
}

extension Packet {
    var description: String {
        return "\(Self.opcode)"
    }
}

protocol ServerPacket: Packet {
    static func parse(payload: [UInt8]) throws -> Self
}

protocol ClientPacket: Packet {
    var payload: [UInt8] { get }
}

struct UnknownPacket: ServerPacket {
    static var opcode = Opcode.init(rawValue: 0xDEAD)!
    
    enum Error: Swift.Error {
        case unknownPacket
    }
    
    static func parse(payload: [UInt8]) throws -> UnknownPacket {
        throw Error.unknownPacket
    }
}
