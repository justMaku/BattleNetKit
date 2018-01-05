//
//  Log.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 06.12.17.
//

import Foundation
import Rainbow

public enum Log {
    private enum Level: String {
        case debug
        case warning
        case error
        
        var color: Color {
            switch self {
            case .debug: return .magenta
            case .warning: return .yellow
            case .error: return .red
            }
        }
    }
    
    public enum Domain: String {
        case aurora
        case connection
        case authentication
        case client
        case gamesUtilities
        case realmlist
    }
    
    static public var enabled = true
    static public let shouldUseColors = true
    
    public static func debug(_ message: @autoclosure () -> String, domain: Domain? = nil) {
        log(message, level: .debug, domain: domain)
    }
    
    public static func warning(_ message: @autoclosure () -> String, domain: Domain? = nil) {
        log(message, level: .warning, domain: domain)
    }

    public static func error(_ message: @autoclosure () -> String, domain: Domain? = nil) {
        log(message, level: .error, domain: domain)
    }

    private static func log(_ message: @autoclosure () -> String, level: Level, domain: Domain? = nil) {
        guard Log.enabled else {
            return
        }
        
        var output = "[\(level.rawValue.uppercased())]"
        
        if let domain = domain {
            output += "[\(domain)]"
        }
        
        output += " " + message()
        
        if Log.shouldUseColors {
            print(output.applyingColor(level.color))
        } else {
            print(output)
        }
    }
}
