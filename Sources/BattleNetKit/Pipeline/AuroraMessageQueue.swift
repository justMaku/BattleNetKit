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
        do {
            let envelope = try wrap(call: call)
            let promise = channel.eventLoop.makePromise(of: Message.self)
            let future = channel.writeAndFlush(envelope)

            future.cascadeFailure(to: promise)
            queue[envelope.header.token] = (call.method.responseType, promise)

            return future.flatMap {
                return promise.futureResult.map {
                    return $0 as! Response
                }
            }
        } catch let error {
            return channel.eventLoop.makeFailedFuture(error)
        }
    }

    internal func enqueue(call: AuroraMethodCall) -> EventLoopFuture<()> {
        do {
            let envelope = try wrap(call: call)
            return channel.writeAndFlush(envelope)
        } catch let error {
            return channel.eventLoop.makeFailedFuture(error)
        }
    }

    internal func enqueue(reply: Message, to originalEnvelope: AuroraEnvelope) -> EventLoopFuture<()> {
        do {
            let envelope = try wrap(
                message: reply,
                methodID: originalEnvelope.header.methodID,
                serviceID: ReplyService.id,
                token: originalEnvelope.header.token
            )

            return channel.writeAndFlush(envelope)
        } catch let error {
            return channel.eventLoop.makeFailedFuture(error)
        }
    }

    private func nextToken() -> UInt32 {
        currentToken &+= 1

        return currentToken
    }

    internal func wrap(call: AuroraMethodCall) throws -> AuroraEnvelope {
        return try self.wrap(message: call.message, methodID: call.method.id, serviceHash: type(of: call.service).hash())
    }

    internal func wrap(
        message: Message,
        methodID: UInt32 = 0,
        serviceID: UInt32 = 0,
        serviceHash: UInt32 = 0,
        token: UInt32? = nil
    ) throws -> AuroraEnvelope {
        var header = Bgs_Protocol_Header()

        header.token = token ?? self.nextToken()
        header.serviceID = serviceID
        header.methodID = methodID
        header.serviceHash = serviceHash
        header.size = try! UInt32(message.serializedData().count) // TODO: WTF MAKU

        return AuroraEnvelope(header: header, message: message)
    }

    public func get(_ token: UInt32) throws -> QueuedMessage {
        guard let entry = self.queue[token] else {
            throw Error.unknownQueueEntry(token: token)
        }

        return entry
    }

    public func dequeue(for token: UInt32) throws -> QueuedMessage {
        guard let entry = self.queue.removeValue(forKey: token) else {
            throw Error.unknownQueueEntry(token: token)
        }

        return entry
    }
}
