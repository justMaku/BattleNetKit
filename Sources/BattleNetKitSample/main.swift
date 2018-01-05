//
//  main.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.01.18.
//

import Foundation
import BattleNetKit

// Setup Environment
do {
    guard CommandLine.argc == 2 else {
        Log.error("No token given")
        exit(1)
    }
    
    // Log.enabled = fals // To disable logging.
    
    let token = CommandLine.arguments[1]
    let dumper = try BattleNetRealmlistDumper(region: .test, token: token)
    try dumper.connect()
    
    
} catch let error {
    Log.error(error.localizedDescription)
    exit(1)
}

// Start RunLoop
while (RunLoop.current.run(mode: .defaultRunLoopMode, before: .distantFuture)) {}
