//
//  Compression.swift
//  BattleNetKitSample
//
//  Created by Michał Kałużny on 22.08.18.
//

import Foundation
import CZlib

class Compression {
    
    static let `default` = Compression.init()
    
    enum Error: Swift.Error {
        case zlibError(underlyingError: Int32)
        case corruptedData
    }
    
    private var stream = z_stream()
    private var dictionary = [UInt8].init(repeating: 0, count: 0x8000)
    
    let bufferSize = 16 * 1024

    init() {
        var result = inflateInit2_(&stream, -15, ZLIB_VERSION, Int32(MemoryLayout<z_stream>.size))
        
        guard result == Z_OK else {
            fatalError()
        }
        
        result = inflateSetDictionary(&stream, &dictionary, 0x8000)
    }
    
    public func inflate(data: [UInt8], expectedSize: UInt32) -> [UInt8] {
        var encoded = Data(data)
        
        encoded.withUnsafeMutableBytes { pointer in
            stream.next_in = pointer
        }
        
        stream.avail_in = UInt32(encoded.count)
        
        var decoded = Data(count: Int(expectedSize))
        decoded.withUnsafeMutableBytes { pointer in
            stream.next_out = pointer
        }
        stream.avail_out = expectedSize
        
        let result = zlib.inflate(&stream, Z_SYNC_FLUSH)
        if result != Z_OK {
            fatalError("lol, idiot")
        }
                
        return decoded.bytes
    }
}
