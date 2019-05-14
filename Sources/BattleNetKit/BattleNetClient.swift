import NIO
import NIOSSL

public class BattleNetClient {
    private let group: MultiThreadedEventLoopGroup
    private let bootstrap: ClientBootstrap
    private var channel: Channel? = nil

    private let auroraHandler: AuroraConnectionHandler

    public init() throws {
        // SSL Configuration
        let configuration = TLSConfiguration.forClient()
        let context = try NIOSSLContext(configuration: configuration)
        let handler = try NIOSSLClientHandler(context: context, serverHostname: "eu.actual.battle.net")

        let auroraHandler = AuroraConnectionHandler()
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)
        let bootstrap = ClientBootstrap(group: group)
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            .channelInitializer { channel in
                let _ = channel.pipeline.addHandler(handler)
                return channel.pipeline.addHandler(auroraHandler)
            }

        self.group = group
        self.bootstrap = bootstrap
        self.auroraHandler = auroraHandler
    }

    deinit {
        try! self.group.syncShutdownGracefully()
    }

    public func send() {
        var buffer = self.channel!.allocator.buffer(capacity: 12)
        buffer.writeString("test")
        self.channel?.writeAndFlush(buffer)
    }

    public func run() throws {
        let channel = self.bootstrap.connect(host: "eu.actual.battle.net", port: 1119)
        self.channel = try channel.wait()

        try self.channel?.closeFuture.wait()
    }
}
