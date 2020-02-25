import Foundation

public struct EntityId {
    enum Error: Swift.Error {
        case unparsableStringRepresentation(string: String)
    }

    let high: UInt64
    let low: UInt64

    var stringRepresentation: String {
        return "\(String(format: "%16llx", self.high))-\(String(format: "%016llx", self.low))"
    }

    var proto: Bgs_Protocol_EntityId {
        var proto = Bgs_Protocol_EntityId()
        proto.high = self.high
        proto.low = self.low

        return proto
    }
}

extension EntityId {
    public init(proto: Bgs_Protocol_EntityId) {
        self.high = proto.high
        self.low = proto.low
    }

    public init(stringRepresentation: String) throws {
        let parts = stringRepresentation.split(separator: "-")

        guard
            parts.count == 2,
            let high = UInt64(parts[0], radix: 16),
            let low = UInt64(parts[1], radix: 16)
        else {
            throw Error.unparsableStringRepresentation(string: stringRepresentation)
        }

        self.high = high
        self.low = low
    }
}

extension EntityId {
    init(with proto: Bgs_Protocol_EntityId) {
        self.high = proto.high
        self.low = proto.low
    }
}

extension EntityId: Codable {
    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)

        try self.init(stringRepresentation: value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.stringRepresentation)
    }
}
