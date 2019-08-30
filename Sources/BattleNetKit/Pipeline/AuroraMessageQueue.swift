import NIO

internal final class AuroraMethodCall {
    let message: Message
    let service: ServiceType
    let method: MethodType

    internal init(message: Message, service: ServiceType, method: MethodType) {
        self.message = message
        self.service = service
        self.method = method
    }
}

internal final class AuroraMessageQueue {
    typealias QueuedMessage = (responseType: Message.Type, handlerPromise: EventLoopPromise<Message>)

    enum Error: Swift.Error {
        case unknownQueueEntry(token: UInt32)
    }

    private var currentToken: UInt32 = 0
    private let channel: Channel

    private var queue: [UInt32: QueuedMessage] = [:]

    internal init(channel: Channel) {
        self.channel = channel
    }

    internal func enqueue<Response: Message>(call: AuroraMethodCall) -> EventLoopFuture<Response> {
        let envelope = wrap(call: call)
        let promise = channel.eventLoop.makePromise(of: Message.self)
        let future = channel.writeAndFlush(envelope)

        future.cascadeFailure(to: promise)
        queue[envelope.header.token] = (call.method.responseType, promise)

        return future.flatMap {
            promise.futureResult.map { $0 as! Response }
        }
    }

    internal func enqueue(call: AuroraMethodCall) -> EventLoopFuture<()> {
        let envelope = wrap(call: call)
        return channel.writeAndFlush(envelope)
    }

    private func nextToken() -> UInt32 {
        currentToken &+= 1

        return currentToken
    }

    internal func wrap(call: AuroraMethodCall) -> AuroraEnvelope {
        var header = Bgs_Protocol_Header()

        header.token = nextToken()
        header.methodID = call.method.id
        header.serviceID = call.service.id ?? 0
        header.size = try! UInt32(call.message.serializedData().count) // TODO: WTF MAKU

        return AuroraEnvelope(header: header, message: call.message)
    }

    public func dequeue(for token: UInt32) throws -> QueuedMessage {
        guard let entry = self.queue.removeValue(forKey: token) else {
            throw Error.unknownQueueEntry(token: token)
        }

        return entry
    }
}
