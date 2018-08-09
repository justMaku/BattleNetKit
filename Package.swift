// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "BattleNetKit",
    products: [
        .library(name: "BattleNetKit", targets: ["BattleNetKit"]),
        .library(name: "BattleNetKit", type: .static, targets: ["BattleNetKit"]),
        .library(name: "BattleNetKit", type: .dynamic, targets: ["BattleNetKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/tls", from: "0.8.0"),
        .package(url: "https://github.com/apple/swift-protobuf", from: "1.0.2"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/IBM-Swift/CZlib", from: "0.1.2"),
        .package(url: "https://github.com/antitypical/Result.git", from: "3.2.4"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "0.11.0")
    ],
    targets: [
        .target(
            name: "BattleNetKit",
            dependencies: [
                "TLS",
                "SwiftProtobuf",
                "Rainbow",
                "CZlib",
                "Result"
            ]
        ),
        .target(
            name: "BattleNetKitSample",
            dependencies: [
                "CryptoSwift",
                "BattleNetKit"
            ]
        )
    ],
    swiftLanguageVersions: [4]
)
