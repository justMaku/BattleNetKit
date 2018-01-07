//
//  main.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation
import BattleNetKit

func fail(_ error: String) throws -> Never {
    struct Error: Codable {
        let error: String
    }
    
    let error = Error(error: error)
    let encoder = JSONEncoder()
    
    let data = try encoder.encode(error)
    print(data.string)
    
    exit(1)
}

// Setup Environment
do {
    guard CommandLine.argc == 2 else {
        try fail("no token given")
    }
    
    // Log.enabled = false // To disable logging.
    
    let token = CommandLine.arguments[1]
    let dumper = try BattleNetRealmlistDumper(region: .test, token: token)
    try dumper.connect()
} catch let error {
    try! fail(error.localizedDescription)
}

// Start RunLoop
RunLoop.current.run()

