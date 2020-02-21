import Foundation

import NIO
import SwiftCLI

import BattleNetKit

class GameAccountsCommand: AuroraCommand<[GameAccount]> {
    init() {
        super.init(
            name: "gameaccounts",
            shortDescription: "Returns list of game accounts associated with this account"
        )
    }

    override func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {
        let futures = response.gameAccountID.map { gameAccountID in
            client.api.account.getGameAccountState(accountID: response.accountID, gameAccountID: gameAccountID)
        }

        return EventLoopFuture<ResultType>.join(futures, eventLoop: client.eventLoop)
    }
}
