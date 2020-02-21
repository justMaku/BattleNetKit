import Foundation

import NIO
import SwiftCLI

import BattleNetKit

extension Environment: ConvertibleFromString {}
extension EntityId: ConvertibleFromString {
    public init?(input: String) {
        do {
            try self.init(stringRepresentation: input)
        } catch {
            return nil
        }
    }
}

class RealmlistCommand: AuroraCommand<Realmlist> {
    @Param var environment: Environment
    @Param var gameAccountId: EntityId

    init() {
        super.init(
            name: "realmlist",
            shortDescription: "Returns the realmlist"
        )
    }

    override func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {
        return client.api.realmlist
            .requestRealmlist(
                for: self.gameAccountId,
                with: response.sessionKey,
                environment: self.environment
        )
    }
}
