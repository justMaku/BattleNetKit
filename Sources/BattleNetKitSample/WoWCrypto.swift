//
//  WoWCrypto.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation
import CryptoSwift

enum WoWCrypto {
    private static let clientSeed: [UInt8] =     [0xCE, 0x52, 0x53, 0x32, 0x17, 0xF4, 0xAB, 0x3F, 0x32, 0x89, 0x60, 0x57, 0x64, 0x4C, 0x41, 0x82]
    private static let sessionSeed: [UInt8] =    [0x58, 0xCB, 0xCF, 0x40, 0xFE, 0x2E, 0xCE, 0xA6, 0x5A, 0x90, 0xB8, 0x01, 0x68, 0x6C, 0x28, 0x0B]
    private static let realmJoinSalt: [UInt8] =  [0xC5, 0xC6, 0x98, 0x95, 0x76, 0x3F, 0x1D, 0xCD, 0xB6, 0xA1, 0x37, 0x28, 0xB3, 0x12, 0xFF, 0x8A]
    private static let decryptionKey: [UInt8] =  [0x08, 0xF1, 0x95, 0x9F, 0x47, 0xE5, 0xD2, 0xDB, 0xA1, 0x3D, 0x77, 0x8F, 0x3F, 0x3E, 0xE7, 0x00]
    private static let encryptionKey: [UInt8] =  [0x40, 0xAA, 0xD3, 0x92, 0x26, 0x71, 0x43, 0x47, 0x3A, 0x31, 0x08, 0xA6, 0xE7, 0xDC, 0x98, 0x2A]
    
    private static let realmJoinLength = 24
    
    public static func realmJoinProof(clientSecret: [UInt8], joinSecret: [UInt8], clientChallange: [UInt8], serverChallange: [UInt8]) throws -> [UInt8] {
        var sha2 = SHA2(variant: .sha256)
        _ = try sha2.update(withBytes: clientSecret + joinSecret)
        _ = try sha2.update(withBytes: clientSeed)
        let key = try sha2.finish()
        let hash = HMAC(key: key, variant: .sha256)
        let result = try hash.authenticate(clientChallange + serverChallange + realmJoinSalt)
        return result.prefix(realmJoinLength).array
    }
    
    public static func sessionKey(clientSecret: [UInt8], joinSecret: [UInt8], clientChallange: [UInt8], serverChallange: [UInt8]) throws -> [UInt8] {
        var sha2 = SHA2(variant: .sha256)
        _ = try sha2.update(withBytes: clientSecret + joinSecret)
        let key = try sha2.finish()
        let hash = HMAC(key: key, variant: .sha256)
        let result = try hash.authenticate(serverChallange + clientChallange + sessionSeed)

        return try SessionKeyGenerator(seed: result).generate(size: 40)
    }
    
    public static var decryptor: RC4 = RC4()
    
    public static func startDecrypt(sessionKey: [UInt8]) throws {
        let sha1 = HMAC.init(key: self.decryptionKey, variant: HMAC.Variant.sha1)
        let arcHash = try sha1.authenticate(sessionKey)
        let arc = RC4()
        arc.initialize(key: arcHash)
        
        self.decryptor = arc
        
        for _ in 0..<1024 {
            var _ = arc.next()
        }
    }
    
    public static func decrypt(data: [UInt8]) throws -> [UInt8] {
        let decrypted = self.decryptor.update(data: data)
        
        return decrypted
    }
}
