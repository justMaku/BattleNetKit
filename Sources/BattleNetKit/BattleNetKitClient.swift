import NIO
import NIOSSL

public class BattleNetKitClient {
    private let group: MultiThreadedEventLoopGroup
    private let bootstrap: ClientBootstrap
    private var channel: Channel? = nil

    public init() throws {
        // SSL Configuration
        let configuration = TLSConfiguration.forClient()
        let context = try NIOSSLContext(configuration: configuration)
        let handler = try NIOSSLClientHandler(context: context, serverHostname: "eu.actual.battle.net")

        let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)
        let bootstrap = ClientBootstrap(group: group)
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            .channelInitializer { channel in
                channel.pipeline.addHandler(handler)
                return channel.pipeline.addHandler(AuroraConnectionHandler())
            }

        self.group = group
        self.bootstrap = bootstrap
    }

    deinit {
        try! self.group.syncShutdownGracefully()
    }

    public func run() throws {
        let channel = self.bootstrap.connect(host: "eu.actual.battle.net", port: 1119)
        self.channel = try channel.wait()

        try self.channel?.closeFuture.wait()
    }
}
