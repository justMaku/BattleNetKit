//
//  WoWCrypto.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation
import CryptoSwift

enum WoWCrypto {
    private static let clientSeed: [UInt8] = [0x81, 0x09, 0x3D, 0xDE, 0x32, 0x9F, 0xA8, 0x30, 0x5A, 0xB9, 0x0C, 0xEB, 0x8B, 0xB2, 0x5E, 0x42]
    private static let sessionSeed: [UInt8] = [0x58, 0xCB, 0xCF, 0x40, 0xFE, 0x2E, 0xCE, 0xA6, 0x5A, 0x90, 0xB8, 0x01, 0x68, 0x6C, 0x28, 0x0B]
    private static let realmJoinSalt: [UInt8] = [0xC5, 0xC6, 0x98, 0x95, 0x76, 0x3F, 0x1D, 0xCD, 0xB6, 0xA1, 0x37, 0x28, 0xB3, 0x12, 0xFF, 0x8A]
    private static let decryptionKey: [UInt8] =  [0x08, 0xF1, 0x95, 0x9F, 0x47, 0xE5, 0xD2, 0xDB, 0xA1, 0x3D, 0x77, 0x8F, 0x3F, 0x3E, 0xE7, 0x00];
    private static let encryptionKey: [UInt8] =  [0x40, 0xAA, 0xD3, 0x92, 0x26, 0x71, 0x43, 0x47, 0x3A, 0x31, 0x08, 0xA6, 0xE7, 0xDC, 0x98, 0x2A];
    
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
        let decrypted = self.decryptor.decrypt(data: data)
        
        return decrypted
    }
    
    public class SessionKeyGenerator {
        let lower: [UInt8]
        let upper: [UInt8]
        var buffer: [UInt8]
        var used = 0
        
        init(seed: [UInt8]) throws {
            let halfSize = seed.count/2
            self.upper = SHA2(variant: .sha256).calculate(for: seed.prefix(halfSize).array)
            self.lower = SHA2(variant: .sha256).calculate(for: seed.suffix(halfSize).array)
            self.buffer = [UInt8].init(repeating: 0, count: seed.count)
            
            try self.fill()
        }
        
        fileprivate func generate(size: Int) throws -> [UInt8] {
            var result = [UInt8].init(repeating: 0x00, count: size)
            for i in 0..<size {
                if (used == SHA2.Variant.sha256.digestLength) {
                    try self.fill()
                }
                
                result[i] = self.buffer[used]
                used += 1
            }
            
            return result
        }
        
        private func fill() throws {
            var buffer = SHA2(variant: .sha256)
            _ = try buffer.update(withBytes: self.upper)
            _ = try buffer.update(withBytes: self.buffer)
            _ = try buffer.update(withBytes: self.lower)
            
            self.buffer = try buffer.finish()
            self.used = 0
        }
    }
}
