import Foundation

extension Data {
    var bytes: [UInt8] {
        var bytes = [UInt8]()

        bytes = self.withUnsafeBytes({ (pointer: UnsafeRawBufferPointer) -> [UInt8] in
            return [UInt8](pointer)
        })

        return bytes
    }
}
