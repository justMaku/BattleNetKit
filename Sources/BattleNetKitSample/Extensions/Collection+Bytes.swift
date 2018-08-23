//
//  Collection+Bytes.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation

private let CHexLookup : [Character] = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" ]
extension Collection where Self.Element == UInt8 {
    
    public func hexString() -> String {
        var stringToReturn = ""
        
        for byte in self {
            let asInt = Int(byte)
            stringToReturn.append(CHexLookup[asInt >> 4])
            stringToReturn.append(CHexLookup[asInt & 0x0f])
        }
        
        return stringToReturn
    }
}
