import BattleNetKit
import Foundation

let (client, closeFuture) = try BattleNet(region: .eu).client().wait()

let res = try client.connect().wait()

closeFuture.whenComplete { result in
    print(result)
}

try closeFuture.wait()
