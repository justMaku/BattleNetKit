import Foundation

import NIO

internal final class AuroraConnectionHandler: ChannelInboundHandler {
    public typealias InboundIn = ByteBuffer
    public typealias OutboundOut = ByteBuffer

    private var numBytes = 0

    public func channelActive(context: ChannelHandlerContext) {
        print("Client connected to \(context.remoteAddress!)")
    }

    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        var byteBuffer = self.unwrapInboundIn(data)
        self.numBytes -= byteBuffer.readableBytes

        if self.numBytes == 0 {
            if let string = byteBuffer.readString(length: byteBuffer.readableBytes) {
                print("Received: '\(string)' back from the server, closing channel.")
            } else {
                print("Received the line back from the server, closing channel")
            }
            context.close(promise: nil)
        }
    }

    public func errorCaught(context: ChannelHandlerContext, error: Error) {
        print("error: ", error)

        // As we are not really interested getting notified on success or failure we just pass nil as promise to
        // reduce allocations.
        context.close(promise: nil)
    }
}
