// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "BattleNetKit",
    platforms: [
        .macOS("10.15"),
        .iOS("13.0.0"),
    ],
    products: [
        .library(
            name: "BattleNetKit",
            targets: ["BattleNetKit"]
        ),
        .executable(
            name: "Aurora",
            targets: ["Aurora"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/CZlib", from: "0.1.2"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.3.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.6.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.6.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.1.5"),
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "BattleNetKit",
            dependencies: [
                "NIO",
                "NIOSSL",
                "Rainbow",
                "SwiftProtobuf",
                "CZlib",
            ]
        ),
        .target(
            name: "Aurora",
            dependencies: [
                "BattleNetKit",
                "SwiftCLI",
            ]
        ),
    ]
)
