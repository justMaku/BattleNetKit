import Foundation

public typealias Realmlist = [RealmlistSubregionEntry]

public struct RealmlistSubregionEntry: Encodable {
    public let subregion: Subregion
    public let realms: [RealmlistRealmEntry]

    init(subregion: Subregion, realms: [RealmlistRealmEntry]) {
        self.subregion = subregion
        self.realms = realms.sorted { $0.realm < $1.realm }
    }

    enum CodingKeys: String, CodingKey {
        case subregion
        case realms
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(subregion.description, forKey: .subregion)
        try container.encode(realms, forKey: .realms)
    }
}

public struct RealmlistRealmEntry: Encodable {
    public let realm: Realm
    public let addresses: [Address]
}

public struct Realm: Hashable, Equatable, Encodable, Comparable, CustomStringConvertible {
    public enum Flag: UInt32, CaseIterable, Encodable {
        case versionMismatch = 0x1
        case unk2 = 0x2
        case unk3 = 0x4
        case unk4 = 0x8
        case unk5 = 0x10
        case unk6 = 0x20
        case unk7 = 0x40
        case unk8 = 0x80
        case unk9 = 0x100
        case unk10 = 0x200
        case unk11 = 0x400
        case unk12 = 0x800
        case unk13 = 0x1000
        case unk14 = 0x2000
        case unk15 = 0x4000
        case unk16 = 0x8000
        case unk17 = 0x10000
        case unk18 = 0x20000
        case unk19 = 0x40000
        case unk20 = 0x80000
        case unk21 = 0x100000
        case unk22 = 0x200000
        case unk23 = 0x400000
        case unk24 = 0x800000
        case unk25 = 0x1000000
        case unk26 = 0x2000000
        case unk27 = 0x4000000
        case unk28 = 0x8000000
        case unk29 = 0x1000_0000
        case unk30 = 0x2000_0000
        case unk31 = 0x4000_0000
        case unk32 = 0x8000_0000

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(String(describing: self))
        }
    }

    public enum PopulationState: Int32, Encodable {
        case offline = 0
        case low
        case medium
        case high
        case new
        case recommended
        case full
        case locked

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(String(describing: self))
        }
    }

    public let name: String
    public let supportedVersion: Version
    public let identifier: UInt32
    public let populationState: PopulationState
    public let flags: [Flag]
    public let cfgTimezonesID: Int32
    public let cfgRealmsID: Int32
    public let cfgConfigsID: Int32
    public let cfgLanguagesID: Int32
    public let cfgCategoriesID: Int32

    init(jam: JamJSONRealmEntry) {
        self.name = jam.name
        self.supportedVersion = Version(jam: jam.version)
        self.identifier = jam.wowRealmAddress
        self.populationState = PopulationState(rawValue: jam.populationState)!
        self.flags = Flag.allCases.filter { ($0.rawValue & jam.flags) == $0.rawValue }
        self.cfgTimezonesID = jam.cfgTimezonesID
        self.cfgRealmsID = jam.cfgRealmsID
        self.cfgConfigsID = jam.cfgConfigsID
        self.cfgLanguagesID = jam.cfgLanguagesID
        self.cfgCategoriesID = jam.cfgCategoriesID
    }

    public var region: UInt32 {
        return UInt32(identifier >> 24 & 0x0000_00ff)
    }

    public var group: UInt32 {
        return UInt32(identifier >> 16 & 0x0000_00ff)
    }

    public var id: UInt32 {
        return UInt32(identifier & 0x0000_ffff)
    }

    public static func == (lhs: Realm, rhs: Realm) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }

    public var description: String {
        return "[\(self.region)-\(self.group)-\(self.id)] \(self.name)\nFlags: \(self.flags)\nPopulation State: \(self.populationState)"
    }

    public static func < (lhs: Realm, rhs: Realm) -> Bool {
        return lhs.cfgRealmsID < rhs.cfgRealmsID
    }
}
