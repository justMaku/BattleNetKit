// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BattleNetKit",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
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
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.1.5"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.5.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "BattleNetKit",
            dependencies: [
                "NIO",
                "NIOSSL",
                "Rainbow",
                "SwiftProtobuf",
            ]
        ),
        .target(
            name: "Aurora",
            dependencies: [
                "BattleNetKit",
            ]
        ),
    ]
)
