import CZlib
import Foundation

private let defaultChunkSize: Int = 16 * 1024

public extension Data {
    enum Error: Swift.Error {
        case compressionError(underlyingError: Int32)
        case corruptedData
    }

    func decode(windowBits: Int32 = 0) throws -> Data {
        let streamSize = Int32(MemoryLayout<z_stream>.size)
        let bufferSize = defaultChunkSize

        var decoded = Data()

        var stream = z_stream()
        var result = inflateInit2_(&stream, windowBits, ZLIB_VERSION, streamSize)
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

            stream.next_in = chunk.withUnsafeMutableBytes { pointer in
                return pointer.baseAddress?.assumingMemoryBound(to: UInt8.self)
            }

            position += chunk.count

            repeat {
                stream.avail_out = UInt32(bufferSize)

                var outputData = Data(count: bufferSize)
                stream.next_out = outputData.withUnsafeMutableBytes { pointer in
                    return pointer.baseAddress?.assumingMemoryBound(to: UInt8.self)
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
