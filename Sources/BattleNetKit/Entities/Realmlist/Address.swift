import Foundation

public struct Address: CustomStringConvertible, Codable, Hashable, Comparable {
    public var description: String {
        return self.address + ":" + String(self.port)
    }

    public let port: UInt16
    public let address: String

    init(jam: JamJSONRealmListServerIPAddress) {
        self.port = jam.port
        self.address = jam.ip
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }

    public static func < (lhs: Address, rhs: Address) -> Bool {
        return lhs.address < rhs.address && lhs.port < rhs.port
    }
}
