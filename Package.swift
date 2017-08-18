import PackageDescription

let package = Package(
    name: "BattleNetKit",
    dependencies: [
	.Package(url: "https://github.com/vapor/tls.git", majorVersion: 0, minor: 8),
        .Package(url: "https://github.com/apple/swift-protobuf.git", Version(0,9,904))
    ]
)
