import Foundation

import NIO

internal final class AuroraConnectionInboundDispatchingHandler: ChannelInboundHandler {
    public typealias InboundIn = AuroraEnvelope
    public typealias OutboundOut = ()

    let messageDispatcher: AuroraEnvelopeDispatcher

    init(messageDispatcher: AuroraEnvelopeDispatcher) {
        self.messageDispatcher = messageDispatcher
    }

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let envelope = unwrapInboundIn(data)

        do {
            try messageDispatcher.dispatch(envelope: envelope)
        } catch {
            context.fireErrorCaught(error)
        }
    }
}
