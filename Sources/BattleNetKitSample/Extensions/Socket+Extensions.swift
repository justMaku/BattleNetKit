//
//  Socket+Extensions.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 09.08.18.
//

import Foundation
import SocksCore

enum TCPInternetSocketExtensionError: Error {
    case noDataAvailable
}

extension TCPInternetSocket {
    func read(count: Int) throws -> [UInt8] {
        
        var remaining = count
        var buffer: [UInt8] = []
        while buffer.count < count {
            let curr = try self.recv(maxBytes: remaining)
            buffer.append(contentsOf: curr)
            remaining = count - buffer.count
            
            if buffer.count == 0 {
                throw TCPInternetSocketExtensionError.noDataAvailable
            }
        }
        
        return buffer
    }
    
    func read<T: FixedWidthInteger>() throws -> T {
        var bytes = try self.read(count: MemoryLayout<T>.size)
        return T(bytes: bytes)
    }
    
    func write<T: FixedWidthInteger>(value: T) throws  {
        try self.send(data: value.bytes)
    }
}
