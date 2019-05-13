import Foundation

extension Data {
    var bytes: [UInt8] {
        var bytes = [UInt8]()
        bytes = self.withUnsafeBytes {
            [UInt8](UnsafeBufferPointer(start: $0, count: self.count))
        }
        return bytes
    }
}
