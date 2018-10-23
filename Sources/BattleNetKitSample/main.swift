//
//  main.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation
import BattleNetKit

func fail(_ error: Swift.Error) throws -> Never {
    struct Error: Codable {
        let error: String
    }
    
    let error = Error(error: String(reflecting: error))
    let encoder = JSONEncoder()
    
    let data = try encoder.encode(error)
    print(data.string)
    
    exit(1)
}

enum DumperError: Swift.Error {
    case wrongArgs
    case unknownRegion(region: String)
    case unknownEnvironment(environment: String)
}

Log.enabled = false

do {
    guard CommandLine.argc == 4 else {
        try fail(DumperError.wrongArgs)
    }

    let token = CommandLine.arguments[1]
    let regionString = CommandLine.arguments[2]
    let environmentString = CommandLine.arguments[3]
    
    guard let region = try? Region(from: regionString) else {
        throw DumperError.unknownRegion(region: regionString)
    }
    
    guard let environment = RealmlistAPI.Environment.init(rawValue: environmentString) else {
        throw DumperError.unknownEnvironment(environment: environmentString)
    }

    let dumper = try RealmlistClient(region: .us, token: token, environment: environment)
    try dumper.connect()
} catch let error {
    try! fail(error)
}

// Start RunLoop
RunLoop.current.run()

