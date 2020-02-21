import Foundation

import NIO
import SwiftCLI

import BattleNetKit

class AuroraCommand<ResultType: Encodable>: Command {
    typealias ResultType = ResultType

    let jsonEncoder: JSONEncoder = .init()
    let name: String
    let shortDescription: String

    enum Error: Swift.Error {
        case missingRegion
        case missingToken
    }

    @Param var region: Region
    @Param var token: String

    @Flag("-v", "--verbose", "verbose mode")
    var verbose: Bool

    init(name: String, shortDescription: String) {
        self.name = name
        self.shortDescription = shortDescription

        self.jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        Log.enabled = verbose
    }

    func handle(_ error: Swift.Error) -> Never {
        self.output(error.localizedDescription)
    }

    func output<T: Encodable>(_ any: T, error: Bool = false) -> Never {
        guard
            let data = try? self.jsonEncoder.encode(any),
            let string = String(data: data, encoding: .utf8)
        else {
            fatalError("fatal error: can't process output")
        }

        print(string)
        exit(error ? 1 : 0)
    }

    func execute() throws {
        Log.enabled = self.verbose

        do {
            let (client, _, errorFuture) = try BattleNet(region: self.region).client().wait()

            errorFuture.whenFailure { error in
                self.handle(error)
            }

            try client.connect()
                .flatMap { client in
                    client.api.authentication.login(token: self.token).and(value: client)
                }
                .flatMap(self.handler)
                .always { result in
                    switch result {
                    case .success(let data): self.output(data)
                    case .failure(let error): self.handle(error)
                    }
                }
                .flatMap { _ in client.close() }
                .wait()
        } catch let error {
            self.handle(error)
        }
    }

    func handler(response: Bgs_Protocol_Authentication_V1_LogonResult, client: BattleNet.Client) -> EventLoopFuture<ResultType> {
        
        fatalError("handler(response:client:) must be implemented in every AuroraCommand subclass.")
    }
}
