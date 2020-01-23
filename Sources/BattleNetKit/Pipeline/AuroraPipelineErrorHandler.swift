import Foundation
import NIO

public final class AuroraPipelineErrorHandler: ChannelInboundHandler {
    public typealias InboundIn = NIOAny

    private let promise: EventLoopPromise<()>

    public init(promise: EventLoopPromise<()>) {
        self.promise = promise
    }

    public func errorCaught(context: ChannelHandlerContext, error: Error) {
        self.promise.completeWith(.failure(error))

        context.fireErrorCaught(error)
        context.close(promise: nil)
    }
}
