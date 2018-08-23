//
//  FixedWidthInteger.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation

extension FixedWidthInteger {
    init(bytes: [UInt8]) {
        self = bytes.withUnsafeBufferPointer {
            ($0.baseAddress!.withMemoryRebound(to: Self.self, capacity: 1) { $0 })
        }.pointee
    }
    
    var bytes: [UInt8] {
        var value = self
        return withUnsafeBytes(of: &value) { Array($0) }
    }
}
