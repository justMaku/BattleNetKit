import NIO
import NIOSSL

public class BattleNet {
    private let group: MultiThreadedEventLoopGroup
    private let bootstrap: ClientBootstrap

    private let region: Region

    public init(region: Region) throws {
        self.region = region

        // SSL Configuration
        let sslConfiguration = TLSConfiguration.forClient()
        let sslContext = try NIOSSLContext(configuration: sslConfiguration)
        let sslHandler = try NIOSSLClientHandler(context: sslContext, serverHostname: region.host)

        let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)
        let bootstrap = ClientBootstrap(group: group)
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            .channelInitializer { channel in
                let handlers: [ChannelHandler] = [
                    sslHandler,
                ]
                return channel.pipeline.addHandlers(handlers)
            }

        self.group = group
        self.bootstrap = bootstrap
    }

    public func client() -> EventLoopFuture<(Client, EventLoopFuture<()>)> {
        return bootstrap
            .connect(host: region.host, port: 1119)
            .flatMap { channel in
                let client = Client(region: self.region, channel: channel)

                return client
                    .attach(pipeline: channel.pipeline)
                    .map { (client, channel.closeFuture)
                    }
            }
    }

    public class Client {
        public let region: Region

        private let channel: Channel
        private let messageQueue: AuroraMessageQueue
        private let serviceProvider: AuroraServiceProvider

        // - MARK: APIs
        public let connectionAPI: ConnectionAPI

        public init(region: Region, channel: Channel) {
            let messageQueue = AuroraMessageQueue(channel: channel)
            let serviceProvider = AuroraServiceProvider()

            let connectionAPI = ConnectionAPI(
                messageQueue: messageQueue,
                serviceProvider: serviceProvider
            )

            self.region = region
            self.channel = channel
            self.connectionAPI = connectionAPI
            self.messageQueue = messageQueue
            self.serviceProvider = serviceProvider
        }

        internal func attach(pipeline: ChannelPipeline) -> EventLoopFuture<()> {
            let messageEncoder = MessageToByteHandler(AuroraEnvelopeEncoder())
            let messageDecoder = ByteToMessageHandler(AuroraEnvelopeDecoder())

            let resolver = AuroraEnvelopeResolver(
                serviceProvider: serviceProvider,
                messageQueue: messageQueue
            )

            let dispatcher = AuroraEnvelopeDispatcher(
                eventLoop: pipeline.eventLoop,
                serviceProvider: serviceProvider,
                messageQueue: messageQueue
            )

            let resolvingHandler = AuroraConnectionInboundResolvingHandler(envelopeResolver: resolver)
            let dispatchingHandler = AuroraConnectionInboundDispatchingHandler(messageDispatcher: dispatcher)

            return pipeline.addHandlers([
                messageDecoder,
                messageEncoder,
                resolvingHandler,
                dispatchingHandler,
            ])
        }

        public func connect() -> EventLoopFuture<Client> {
            do {
                return try connectionAPI.connect().map {
                    self
                }
            } catch {
                return channel.eventLoop.makeFailedFuture(error)
            }
        }

        public func close() -> EventLoopFuture<()> {
            return channel.close()
        }
    }
}
