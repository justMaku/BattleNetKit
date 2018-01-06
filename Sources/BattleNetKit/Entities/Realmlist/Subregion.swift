//
//  Subregion.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 06.01.18.
//

import Foundation

public struct Subregion: CustomStringConvertible, Hashable, Equatable, Codable {
    enum Error: Swift.Error {
        case invalidVariantType
        case invalidDescription
    }
    
    let unk1: UInt32
    let unk2: UInt32
    let unk3: UInt32
    
    init(unk1: UInt32, unk2: UInt32, unk3: UInt32) {
        self.unk1 = unk1
        self.unk2 = unk2
        self.unk3 = unk3
    }
    
    init(description: String) throws {
        let values = description.split(separator: "-").flatMap { UInt32($0) }
        
        guard values.count == 3 else {
            throw Error.invalidDescription
        }
        
        self.init(unk1: values[0], unk2: values[1], unk3: values[2])
    }
    
    init(variant: Variant) throws {
        guard variant.hasStringValue else {
            throw Error.invalidVariantType
        }
        
        try self.init(description: variant.stringValue)
    }
    
    public var description: String {
        return [unk1, unk2, unk3].flatMap { String($0) }.joined(separator: "-")
    }
    
    public var hashValue: Int {
        return description.hashValue
    }
    
    public static func ==(lhs: Subregion, rhs: Subregion) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
