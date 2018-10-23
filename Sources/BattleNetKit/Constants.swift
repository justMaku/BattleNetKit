//
//  Constants.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

enum Constants {
    public static let auroraClientName = "WoW"
    public static let auroraClientVersion = "Battle.net Game Service SDK v1.11.5 \"1b75249ba9\"/224 (Oct 22 2018 09:29:50)"
    public static let auroraAttributeVersion = "classic1"
    public static let gameClientName = "WoW"
    public static let localeName = "enUS"
    public static let platformType = "Mac"
    public static let platformName = "Mc64"
    public static let clientArchitecture = "x64"
    public static let systemArchitecture = "x64"
    public static let systemVersion = "OS X 10.14"
    public static let buildVariant = "darwin-x86_64-clang-release"

    public static let clientVersion = JamJSONGameVersion(versionMajor: 1, versionMinor: 13, versionRevision: 0, versionBuild: 28211)
}
