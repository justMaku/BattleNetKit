import Foundation

import NIO

internal final class AuroraConnectionHandler: ChannelInboundHandler {
    public typealias InboundIn = UnresolvedAuroraEnvelope
    public typealias OutboundOut = AuroraEnvelope

    private var numBytes = 0

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let envelope = unwrapInboundIn(data)
        print(envelope)

        context.fireChannelReadComplete()
    }

    public func errorCaught(context: ChannelHandlerContext, error: Error) {
        print("error: ", error)

        // As we are not really interested getting notified on success or failure we just pass nil as promise to
        // reduce allocations.
        context.close(promise: nil)
    }
}
