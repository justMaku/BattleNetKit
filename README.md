# BattleNetKit

[![Build Status](https://img.shields.io/circleci/project/github/justMaku/BattleNetKit/master.svg?style=flat)]()
[![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg?style-flat)]()
[![License](https://img.shields.io/github/license/justMaku/BattleNetKit.svg)]()
[![Supported Platforms](https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20Linux-purple.svg)]()

## TL;DR

Blizzard's Battle.net client written in Swift. Nothing works.

## Install

### Swift Package Manager

[Swift Package Manager](https://github.com/apple/swift-package-manager) is currently the only supported way of integrating BattleNetKit with your project.

```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SuperSecretProject",
    dependencies: [
        .package(url: "https://github.com/justMaku/BattleNetKit", from: "0.1.0")
    ]
)
```

To find more information about Swift Package Manager, please visit Apple's [official page](https://swift.org/package-manager/).

## Usage

### Generating SSO Token

> ‼️ Never use your main account's token with BattleNetKit since BattleNetKit is not 100% 

To generate SSO token used to authenticate against Battle.net, you will need to visit [http://eu.battle.net/login/en/flow/wow-and.app?externalChallenge=login](http://eu.battle.net/login/en/flow/wow-and.app?externalChallenge=login). After logging in with your Battle.net credentials, you should be redirected to a localhost webpage with the SSO token in `ST` query parameter. It should look like this: 

```
EU-1d5b6927e5e38b182f33dad16abe3151-80469612
```

### Connecting to Battle.net

```
import Foundation
import BattleNetKit

do {
    // Log.enabled = false // Uncomment to disable logging.
   
    let token = "EU-1d5b6927e5e38b182f33dad16abe3151-80469612" 
    let client = try BattleNet(region: .test, token: token)
    try client.connect()
} catch let error {
    Log.error(error.localizedDescription)
}

while (RunLoop.current.run(mode: .defaultRunLoopMode, before: .distantFuture)) {}
```

## Thanks
[Bernd Lörwald](https://github.com/bloerwald) ([@bloerwald](https://twitter.com/bloerwald)) for patience and constant nerd sniping me into looking more into Battle.net

[Shauren](https://github.com/Shauren) for figuring out most of this stuff way before me, but from the server's perspective.
