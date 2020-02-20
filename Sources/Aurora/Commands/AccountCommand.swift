import Foundation

import NIO
import SwiftCLI

import BattleNetKit

class AccountCommand: AuroraCommand<BattleNetAccount> {
    init() {
        super.init(
            name: "account",
            shortDescription: "Returns information about connected Battle.net account"
        )
    }

    override func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {
        return client.api.account.getAccountState(account: response.accountID)
    }
}
