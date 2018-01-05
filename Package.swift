import PackageDescription

let package = Package(
    name: "BattleNetKit",
    dependencies: [
        .Package(url: "https://github.com/vapor/tls.git", majorVersion: 0, minor: 8),
        .Package(url: "https://github.com/apple/swift-protobuf.git", Version(1,0,2)),
        .Package(url: "https://github.com/onevcat/Rainbow", Version(3,0,0)),
	.Package(url: "https://github.com/IBM-Swift/CZlib", Version(0,1,2)) 
    ]
)
