//
//  ARC4.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation

public class RC4 {
    
    var box: [UInt8] = (0...0xFF).map { $0 }
    
    var i: UInt8 = 0
    var j: UInt8 = 0
    
    public func initialize(key: [UInt8]) {
        self.box = (0...0xFF).map { $0 }
        
        var j: UInt8 = 0
        
        for i in 0...0xFF {
            j = self.box[i].addingReportingOverflow(key[i % key.count]).partialValue.addingReportingOverflow(j).partialValue
            var t = self.box[i]
            self.box[Int(i)] = self.box[Int(j)]
            self.box[Int(j)] = t
        }
        
        self.i = 0
        self.j = 0
    }
    
    public func next() -> UInt8 {
        var t: UInt8 = 0
        var i = self.i
        var j = self.j
        
        i = i.addingReportingOverflow(1).partialValue
        j = j.addingReportingOverflow(self.box[Int(i)]).partialValue
        t = self.box[Int(i)]
        self.box[Int(i)] = self.box[Int(j)]
        self.box[Int(j)] = t
        
        self.i = i
        self.j = j
        var index = self.box[Int(i)].addingReportingOverflow(self.box[Int(j)]).partialValue
        return self.box[Int(index)]
    }
    
    public func decrypt(data: [UInt8]) -> [UInt8] {
        var result: [UInt8] = []
        
        for byte in data {
            result.append(self.next() ^ byte)
        }
        
        return result
    }
}
