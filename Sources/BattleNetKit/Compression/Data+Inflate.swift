//
//  ClientRequest+Builder.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 05.01.2018.
//

import Foundation
import CZlib

private let defaultChunkSize: Int = 16 * 1024

extension Data {
    enum Error: Swift.Error {
        case compressionError(underlyingError: Int32)
        case corruptedData
    }
    
    func decode() throws -> Data {
        let streamSize = Int32(MemoryLayout<z_stream>.size)
        let bufferSize = defaultChunkSize
        
        var decoded = Data()
        
        var stream = z_stream()
        var result = inflateInit_(&stream, ZLIB_VERSION, streamSize)
        defer {
            inflateEnd(&stream)
        }
        
        guard result == Z_OK else {
            throw Error.compressionError(underlyingError: result)
        }
        
        
        var position = 0
        repeat {

            let upperBound = Swift.min(self.count, position + bufferSize)
            var chunk = self.subdata(in: position..<upperBound)
            stream.avail_in = UInt32(chunk.count)

            chunk.withUnsafeMutableBytes { (bytes: UnsafeMutablePointer<Bytef>) in
                stream.next_in = bytes
            }
            
            position += chunk.count
            
            repeat {
        
                stream.avail_out = UInt32(bufferSize)
                
                var outputData = Data(count: bufferSize)
                outputData.withUnsafeMutableBytes { (bytes: UnsafeMutablePointer<Bytef>) in
                    stream.next_out = bytes
                }
                
                result = inflate(&stream, Z_NO_FLUSH)
                
                guard
                    result == Z_OK || result == Z_STREAM_END
                else {
                    throw Error.corruptedData
                }
                
                let remainingLength = UInt32(bufferSize) - stream.avail_out
                outputData.count = Int(remainingLength)
                decoded.append(outputData)
            } while stream.avail_out == 0
        } while result != Z_STREAM_END
        
        return decoded
    }
}
