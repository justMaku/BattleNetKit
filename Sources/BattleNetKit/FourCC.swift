import Foundation

extension String {
    func fourCC() -> UInt32 {
        var value: UInt32 = 0

        let ascii = self.flatMap { $0.unicodeScalars }.filter { $0.isASCII }.map { $0.value }

        for char in ascii {
            value = value << 8 | char
        }

        return value
    }
}

extension UInt32 {
    func fourCC() -> String {
        let bytes = [24, 16, 8, 0]

        var ret: String = ""

        for byte in bytes {
            let ascii = self >> byte & 0xff
            guard let scalar = UnicodeScalar(ascii) else {
                return ret
            }

            ret.append(Character(scalar))
        }

        return ret
    }
}
