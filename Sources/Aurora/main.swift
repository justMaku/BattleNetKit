import Foundation

import NIO
import SwiftCLI

import BattleNetKit

let cli = CLI(name: "aurora", version: "2.0.0", description: "Aurora - CLI companion to BattleNetKit")

cli.commands.append(RealmlistCommand())
cli.commands.append(LicensesCommand())
cli.commands.append(GameAccountsCommand())
cli.commands.append(AccountCommand())

cli.goAndExit()
