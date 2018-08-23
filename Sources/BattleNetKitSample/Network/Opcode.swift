//
//  Opcode.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation

enum Opcode: UInt16 {
    case SMSG_AUTH_CHALLENGE = 0x3048
    case CMSG_AUTH_SESSION = 0x3765
    case SMSG_AUTH_RESPONSE = 0x256C
    case SMSG_ENABLE_ENCRYPTION = 0x3049
    case CMSG_ENABLE_ENCRYPTION_ACK = 0x3767
    case SMSG_MULTIPLE_PACKETS = 0x3051
    case SMSG_COMPRESSED_PACKET = 0x3052
    case CMSG_ENUM_CHARACTERS = 0x35E8
    case CMSG_HOTFIX_REQUEST = 0x35E5
    
    public var bytes: [UInt8] { return self.rawValue.bytes }
    
    public var implementation: Packet.Type {
        switch self {
        case .SMSG_AUTH_CHALLENGE: return AuthChallenge.self
        case .CMSG_AUTH_SESSION: return AuthSession.self
        case .SMSG_AUTH_RESPONSE: return AuthResponse.self
        case .SMSG_ENABLE_ENCRYPTION: return EnableEncryption.self
        case .CMSG_ENABLE_ENCRYPTION_ACK: return AcknowledgeEncryption.self
        case .SMSG_MULTIPLE_PACKETS: return MultiplePackets.self
        case .SMSG_COMPRESSED_PACKET: return CompressedPacket.self
        case .CMSG_ENUM_CHARACTERS: return EnumCharacters.self
        case .CMSG_HOTFIX_REQUEST: return HotfixRequest.self
        }
    }
}
