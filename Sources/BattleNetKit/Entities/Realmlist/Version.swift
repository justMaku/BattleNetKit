//
//  Version.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 06.01.18.
//

import Foundation

public struct Version: CustomStringConvertible, Codable {
    let major: UInt32
    let minor: UInt32
    let patch: UInt32
    let build: UInt32
    
    init(jam: JamJSONGameVersion) {
        self.major = jam.versionMajor
        self.minor = jam.versionMinor
        self.patch = jam.versionRevision
        self.build = jam.versionBuild
    }
    
    public var description: String {
        return "\(major).\(minor).\(patch)" + " (" + String(build) + ")"
    }
}
