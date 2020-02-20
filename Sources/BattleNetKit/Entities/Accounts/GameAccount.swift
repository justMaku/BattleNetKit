import Foundation

public struct GameAccount: Codable {
    public enum Flag: String, Codable {
        case beta
        case lifetime
        case trial
        case restricted
    }

    public enum RealmPermission: UInt32, CaseIterable, Codable {
        case unk1 = 0x1
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
    }

    public let id: EntityId
    public let name: String
    public let program: String
    public let licenses: [UInt32]
    public let realmPermissions: [RealmPermission]
    public let flags: [Flag]
}

extension GameAccount {
    init(with state: Bgs_Protocol_Account_V1_GameAccountState, id: Bgs_Protocol_EntityId) {
        self.id = EntityId(with: id)
        self.name = state.gameLevelInfo.name
        self.program = state.gameLevelInfo.program.fourCC()
        self.licenses = state.gameLevelInfo.licenses.map { $0.id }
        self.realmPermissions = RealmPermission.allCases.filter { ($0.rawValue & state.gameLevelInfo.realmPermissions) == $0.rawValue }

        var flags: [Flag] = []

        if state.gameLevelInfo.isBeta { flags.append(.beta) }
        if state.gameLevelInfo.isTrial { flags.append(.trial) }
        if state.gameLevelInfo.isRestricted { flags.append(.restricted) }
        if state.gameLevelInfo.isLifetime { flags.append(.lifetime) }

        self.flags = flags
    }
}
