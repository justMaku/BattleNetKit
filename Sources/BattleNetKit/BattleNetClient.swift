import NIO
import NIOSSL

public class BattleNetClient {
    private let group: MultiThreadedEventLoopGroup
    private let bootstrap: ClientBootstrap
    private var channel: Channel?

    private let auroraHandler: AuroraConnectionHandler
    private let region: Region

    public init(region: Region) throws {
        self.region = region

        // SSL Configuration
        let sslConfiguration = TLSConfiguration.forClient()
        let sslContext = try NIOSSLContext(configuration: sslConfiguration)
        let sslHandler = try NIOSSLClientHandler(context: sslContext, serverHostname: region.host)

        let auroraHandler = AuroraConnectionHandler()
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)
        let bootstrap = ClientBootstrap(group: group)
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            .channelInitializer { channel in
                let handlers: [ChannelHandler] = [
//                    sslHandler,
                    MessageToByteHandler(AuroraEnvelopeEncoder()),
                    ByteToMessageHandler(AuroraEnvelopeDecoder()),
                    auroraHandler,
                ]
                return channel.pipeline.addHandlers(handlers)
            }

        self.group = group
        self.bootstrap = bootstrap
        self.auroraHandler = auroraHandler
    }

    deinit {
        try! self.group.syncShutdownGracefully()
    }

    public func send() {}

    public func run() throws {
        let channel = bootstrap.connect(host: region.host, port: 1119)
        self.channel = try channel.flatMapThrowing(channelDidConnect).wait()

        try self.channel?.closeFuture.wait()
    }

    private func channelDidConnect(channel: Channel) throws -> Channel {
//        let connectionAPI = ConnectionAPI()

        var header = Bgs_Protocol_Header()

        var connectionRequest = Bgs_Protocol_Connection_V1_ConnectRequest()
        var bindRequest = Bgs_Protocol_Connection_V1_BindRequest()

        var boundService = Bgs_Protocol_Connection_V1_BoundService()

        boundService.id = 0
        boundService.hash = try Bnet_Protocol_Connection_ConnectionService.hash()

        bindRequest.exportedService = [boundService]
        bindRequest.importedService = [boundService]

        connectionRequest.bindRequest = bindRequest

        header.serviceID = 0
        header.methodID = Bnet_Protocol_Connection_ConnectionService.Method.Connect.id

        header.token = 1

        let envelope = AuroraEnvelope(header: header, message: connectionRequest)

        try channel.writeAndFlush(envelope)

        return channel
    }
}
