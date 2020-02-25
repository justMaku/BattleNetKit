import Foundation

public struct Subregion: CustomStringConvertible, Hashable, Equatable, Codable, Comparable {
    enum Error: Swift.Error {
        case invalidVariantType
        case invalidDescription
    }

    public let unk1: UInt32
    public let unk2: UInt32
    public let unk3: UInt32

    init(unk1: UInt32, unk2: UInt32, unk3: UInt32) {
        self.unk1 = unk1
        self.unk2 = unk2
        self.unk3 = unk3
    }

    init(description: String) throws {
        let values = description.split(separator: "-").compactMap { UInt32($0) }

        guard values.count == 3 else {
            throw Error.invalidDescription
        }

        self.init(unk1: values[0], unk2: values[1], unk3: values[2])
    }

    init(variant: Variant) throws {
        guard variant.hasStringValue else {
            throw Error.invalidVariantType
        }

        try self.init(description: variant.stringValue)
    }

    public var description: String {
        return [unk1, unk2, unk3].compactMap { String($0) }.joined(separator: "-")
    }

    public static func == (lhs: Subregion, rhs: Subregion) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    public static func < (lhs: Subregion, rhs: Subregion) -> Bool {
        if lhs.unk1 != rhs.unk1 { return lhs.unk1 < rhs.unk1 }
        if lhs.unk2 != rhs.unk2 { return lhs.unk2 < rhs.unk2 }

        return lhs.unk3 < rhs.unk3
    }
}
