import Foundation

import NIO
import SwiftCLI

import BattleNetKit

extension Environment: ConvertibleFromString {}

class RealmlistCommand: AuroraCommand<Realmlist> {
    @Param var environment: Environment

    init() {
        super.init(
            name: "realmlist",
            shortDescription: "Returns the realmlist"
        )
    }

    override func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {
        return client.api.realmlist.requestRealmlist(for: response.gameAccountID[0], with: response.sessionKey, environment: self.environment)
    }
}
