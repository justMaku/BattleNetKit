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
    @Key("-a", "-account", "Game account ID to use (default: all accounts will be used and realmlist will be merged)")
    var gameAccountId: EntityId?

    init() {
        super.init(
            name: "realmlist",
            shortDescription: "Returns the realmlist"
        )
    }

    private func realmlistFutures(client: BattleNet.Client, loginResponse: Bgs_Protocol_Authentication_V1_LogonResult)
        -> [EventLoopFuture<Realmlist>]
    {
        if let gameAccountId = self.gameAccountId {
            // User has entered the game account id as an option
            return [
                client.api.realmlist.requestRealmlist(
                    for: gameAccountId,
                    with: loginResponse.sessionKey,
                    environment: self.selectedEnvironment
                )
            ]
        } else {
            // We have no game account id, we need to use them all.
            return loginResponse.gameAccountID.map { gameAccountId in
                client.api.realmlist.requestRealmlist(
                    for: .init(proto: gameAccountId),
                    with: loginResponse.sessionKey,
                    environment: self.selectedEnvironment
                )
            }
        }
    }

    override func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {

        let futures = self.realmlistFutures(client: client, loginResponse: response)

        return EventLoopFuture<Realmlist>
            .join(futures, eventLoop: client.eventLoop)
            .map { Realmlist.merge($0) }
    }
}
