import BattleNetKit
import Foundation
import NIO

enum Error: Swift.Error {
    case unableToCreateString
}

let token = ""
let encoder = JSONEncoder()

encoder.dateEncodingStrategy = .iso8601
encoder.outputFormatting = [.prettyPrinted]

private func output<T: Encodable>(_ object: T) {
    do {
        let data = try encoder.encode(object)
        guard let json = String(data: data, encoding: .utf8) else {
            throw Error.unableToCreateString
        }
        print(json)
    } catch let error {
        handle(error)
    }
}

private func handle(_ error: Swift.Error) {
    let errorMessage = "\(String(reflecting: error))"
    output(["error": errorMessage])
}

do {
    let (client, closeFuture, errorFuture) = try BattleNet(region: .cn).client().wait()

    errorFuture.whenFailure { error in
        handle(error)
    }

    try client.connect()
        .flatMap { client in
            client.api.authentication.login(token: token)
        }
        .flatMap { response -> EventLoopFuture<Realmlist> in
            return client.api.realmlist.requestRealmlist(for: response.gameAccountID[0], with: response.sessionKey, environment: .classic)
        }
        .flatMap { _ -> EventLoopFuture<()> in
            output(Date())
            return client.close()
        }

    try closeFuture.wait()
} catch let error {
    handle(error)
}
