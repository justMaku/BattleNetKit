//
//  Crypto.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation
import CryptoSwift

class Crypto {
    
    private static let ClientSeed: [UInt8] =     [0x30, 0x88, 0xBE, 0xC5, 0x9A, 0x2A, 0xF6, 0xF1, 0x7A ,0x80, 0x89, 0x4A, 0x32, 0x29, 0x66, 0x1E]
    private static let SessionSeed: [UInt8] =    [0x58, 0xCB, 0xCF, 0x40, 0xFE, 0x2E, 0xCE, 0xA6, 0x5A, 0x90, 0xB8, 0x01, 0x68, 0x6C, 0x28, 0x0B]
    private static let RealmJoinSeed: [UInt8] =  [0xC5, 0xC6, 0x98, 0x95, 0x76, 0x3F, 0x1D, 0xCD, 0xB6, 0xA1, 0x37, 0x28, 0xB3, 0x12, 0xFF, 0x8A]
    private static let DecryptionKey: [UInt8] =  [0x08, 0xF1, 0x95, 0x9F, 0x47, 0xE5, 0xD2, 0xDB, 0xA1, 0x3D, 0x77, 0x8F, 0x3F, 0x3E, 0xE7, 0x00]
    private static let EncryptionKey: [UInt8] =  [0x40, 0xAA, 0xD3, 0x92, 0x26, 0x71, 0x43, 0x47, 0x3A, 0x31, 0x08, 0xA6, 0xE7, 0xDC, 0x98, 0x2A]

    private static let RealmJoinDigestLength = 24
    private static let SessionKeyLength = 40
 
    private let serverSecret: [UInt8]
    private let clientSecret: [UInt8]
    
    private let encryptor = RC4()
    private let decryptor = RC4()
    
    private (set) var encryptionEnabled = false
    
    public init(clientSecret: [UInt8], serverSecret: [UInt8]) {
        self.serverSecret = serverSecret
        self.clientSecret = clientSecret
    }
    
    public func calculateRealmJoinProof(clientChallenge: [UInt8], serverChallenge: [UInt8]) throws -> [UInt8] {
        let key = SHA2(variant: .sha256).calculate(for: self.clientSecret + self.serverSecret + Crypto.ClientSeed)
        let hash = try HMAC(key: key, variant: .sha256).authenticate(clientChallenge + serverChallenge + Crypto.RealmJoinSeed)
        
        return hash.prefix(Crypto.RealmJoinDigestLength).array
    }
    
    public func calculateSessionKey(clientChallenge: [UInt8], serverChallenge: [UInt8]) throws -> [UInt8] {
        let key = SHA2(variant: .sha256).calculate(for: self.clientSecret + self.serverSecret)
        let hash = try HMAC(key: key, variant: .sha256).authenticate(serverChallenge + clientChallenge + Crypto.SessionSeed)
        
        return try SessionKeyGenerator(seed: hash).generate(size: 40)
    }
    
    public func enable(sessionKey: [UInt8]) throws {
        try self.encryptor.initialize(key: HMAC(key: Crypto.EncryptionKey, variant: .sha1).authenticate(sessionKey))
        try self.decryptor.initialize(key: HMAC(key: Crypto.DecryptionKey, variant: .sha1).authenticate(sessionKey))
        
        [self.encryptor, self.decryptor].forEach { $0.drop(1024) }
        
        self.encryptionEnabled = true
    }
    
    public func encrypt(data: [UInt8]) -> [UInt8] {
        if self.encryptionEnabled {
            return encryptor.update(data: data)
        } else {
            return data
        }
    }
    
    public func decrypt(data: [UInt8]) -> [UInt8] {
        if self.encryptionEnabled {
            return decryptor.update(data: data)
        } else {
            return data
        }
    }
}
