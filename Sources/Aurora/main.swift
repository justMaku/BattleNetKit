import BattleNetKit
import Foundation

let (client, closeFuture, errorFuture) = try BattleNet(region: .eu).client().wait()

errorFuture.always { result in
    print(result)
}

try client.connect().wait()

try closeFuture.wait()
