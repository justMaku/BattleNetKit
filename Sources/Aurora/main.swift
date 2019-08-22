import BattleNetKit
import Foundation

let client = try BattleNetClient(region: .eu)
try client.run()
