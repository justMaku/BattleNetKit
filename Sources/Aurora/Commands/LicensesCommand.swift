import Foundation

import NIO
import SwiftCLI

import BattleNetKit

class LicensesCommand: AuroraCommand<Set<UInt32>> {
    init() {
        super.init(
            name: "licenses",
            shortDescription: "Returns list of licenses associated with this account"
        )
    }

    override func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {
        // Even though there exists a GetLicenses call, it doesn't return all of them, we have to iterate over game accounts too.

        let futures = response.gameAccountID.map { gameAccountID in
            client.api.account.getGameAccountState(accountID: response.accountID, gameAccountID: gameAccountID)
        }

        return EventLoopFuture<Set<UInt32>>
            .join(futures)
            .and(client.api.account.getLicenses(accountID: response.accountID))
            .map { accounts, licenses in
                let standardLicenses = licenses.licenses.map { $0.id }
                let gameAccountLicenses = accounts.map { $0.licenses }.flatMap { $0 }

                return Set(standardLicenses + gameAccountLicenses)
            }
    }
}
