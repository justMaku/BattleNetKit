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

    public func client() -> EventLoopFuture<(Client, EventLoopFuture<()>, EventLoopFuture<()>)> {
        return bootstrap
            .connect(host: region.host, port: 1119)
            .flatMap { channel in
                do {
                    let client = try Client(region: self.region, channel: channel)

                    return client
                        .attach(pipeline: channel.pipeline)
                        .map { (client, channel.closeFuture, client.errorFuture) }
                } catch let error {
                    return channel.eventLoop.makeFailedFuture(error)
                }
            }
    }

    public class Client {
        public let region: Region

        internal var errorFuture: EventLoopFuture<()> {
            return self.errorPromise.futureResult
        }

        private let channel: Channel
        private let messageQueue: AuroraMessageQueue
        private let serviceProvider: AuroraServiceProvider
        private let errorPromise: EventLoopPromise<()>

        // - MARK: APIs
        public let api: APIContainer

        public init(region: Region, channel: Channel) throws {
            let messageQueue = AuroraMessageQueue(channel: channel)
            let serviceProvider = AuroraServiceProvider()

            self.region = region
            self.channel = channel
            self.messageQueue = messageQueue
            self.serviceProvider = serviceProvider
            self.errorPromise = channel.eventLoop.makePromise()

            self.api = try .init(
                connection: ConnectionAPI(
                    eventLoop: channel.eventLoop,
                    serviceProvider: serviceProvider,
                    messageQueue: messageQueue
                ),
                authentication: AuthenticationAPI(
                    eventLoop: channel.eventLoop,
                    serviceProvider: serviceProvider,
                    messageQueue: messageQueue
                ),
                utilities: GameServicesAPI(
                    eventLoop: channel.eventLoop,
                    serviceProvider: serviceProvider,
                    messageQueue: messageQueue
                )
            )
        }

        internal func attach(pipeline: ChannelPipeline) -> EventLoopFuture<()> {
            let messageEncoder = MessageToByteHandler(AuroraEnvelopeEncoder())
            let messageDecoder = ByteToMessageHandler(AuroraEnvelopeDecoder())
            let errorHandler = AuroraPipelineErrorHandler(promise: self.errorPromise)

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
                errorHandler,
            ])
        }

        public func connect() -> EventLoopFuture<Client> {
            return self.api.connection.connect().map { self }
        }

        public func close() -> EventLoopFuture<()> {
            return channel.close()
        }
    }
}
