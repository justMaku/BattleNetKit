public enum Region: UInt32, Codable {
    enum Error: Swift.Error {
        case unknownName(name: String)
        case unknownRegion(code: UInt32)
    }

    case us = 1
    case eu = 2
    case kr = 3
    case test = 98

    var host: String {
        return self.name + ".actual.battle.net"
    }

    var name: String {
        switch self {
        case .us: return "us"
        case .eu: return "eu"
        case .kr: return "kr"
        case .test: return "test"
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.name)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        try self.init(from: value)
    }

    public init(from code: UInt32) throws {
        guard let value = Region(rawValue: code) else {
            throw Error.unknownRegion(code: code)
        }

        self = value
    }

    public init(from entity: Bgs_Protocol_EntityId) throws {
        let code = (UInt32)((entity.high & 0xff_0000_0000) >> 32)

        try self.init(from: code)
    }

    public init(from name: String) throws {
        switch name {
        case Region.eu.name: self = .eu
        case Region.kr.name: self = .kr
        case Region.us.name: self = .us
        case Region.test.name: self = .test
        case _: throw Error.unknownName(name: name)
        }
    }
}
