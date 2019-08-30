import Foundation

import NIO

internal final class AuroraConnectionInboundResolvingHandler: ChannelInboundHandler {
    public typealias InboundIn = UnresolvedAuroraEnvelope
    public typealias OutboundOut = AuroraEnvelope

    let envelopeResolver: AuroraEnvelopeResolver

    init(envelopeResolver: AuroraEnvelopeResolver) {
        self.envelopeResolver = envelopeResolver
    }

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let unresolvedEnvelope = unwrapInboundIn(data)

        do {
            let resolvedEnvelope = try envelopeResolver.resolve(envelope: unresolvedEnvelope)

            context.fireChannelRead(wrapOutboundOut(resolvedEnvelope))
        } catch {
            context.fireErrorCaught(error)
        }
    }
}
