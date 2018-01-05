// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "BattleNetKit",
    products: [
        .library(name: "BattleNetKit", targets: ["BattleNetKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/tls", from: "0.8.0"),
        .package(url: "https://github.com/apple/swift-protobuf", from: "1.0.2"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/IBM-Swift/CZlib", from: "0.1.2")
    ],
    targets: [
        .target(
            name: "BattleNetKit",
            dependencies: [
                "TLS",
                "SwiftProtobuf",
                "Rainbow",
                "CZlib"
            ]
        ),
        .target(
            name: "BattleNetKitSample",
            dependencies: [
                "BattleNetKit"
            ]
        )
    ],
    swiftLanguageVersions: [4]
)
