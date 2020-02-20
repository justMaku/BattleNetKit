import Foundation

public struct BattleNetAccount: Encodable {
    public let licenses: Set<UInt32>
    public let programs: Set<String>
    public let currency: String
    public let country: String
    public let name: String
    public let battleTag: String
    public let email: String
}

extension BattleNetAccount {
    init(with state: Bgs_Protocol_Account_V1_AccountState) {
        self.currency = state.accountLevelInfo.defaultCurrency.fourCC()
        self.country = state.accountLevelInfo.country
        self.name = state.accountLevelInfo.fullName
        self.battleTag = state.accountLevelInfo.battleTag
        self.email = state.accountLevelInfo.email

        let accountLicenses = state.accountLevelInfo.licenses.map { $0.id }
        let gameLicenses = state.gameLevelInfo.map { $0.licenses.map { $0.id } }.flatMap { $0 }
        let gameLevelInfoPrograms = state.gameLevelInfo.map { $0.program.fourCC() }
        let gameStatusPrograms = state.gameStatus.map { $0.program.fourCC() }
        let gameAccountPrograms = state.gameAccounts.map { $0.handle.map { $0.program.fourCC() } }.flatMap { $0 }

        self.licenses = Set(accountLicenses + gameLicenses)
        self.programs = Set(gameLevelInfoPrograms + gameStatusPrograms + gameAccountPrograms)
    }
}
