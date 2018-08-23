//
//  SessionKeyGenerator.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 10.08.18.
//

import Foundation
import CryptoSwift

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
    
    public func generate(size: Int) throws -> [UInt8] {
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
        self.buffer = SHA2(variant: .sha256).calculate(for: self.upper + self.buffer + self.lower)
        self.used = 0
    }
}
