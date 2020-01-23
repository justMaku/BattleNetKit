import NIO

internal final class AuroraEnvelopeDispatcher {
    enum Error: Swift.Error {
        case errorStatus(status: BattleNetStatus)
        case unknownStatus(status: UInt32)
        case unknownMethod(service: ServiceType, methodId: UInt32)
        case missingRequestMessage
        case missingResponeMessage
        case unexpectedMessageType(expected: Message.Type, received: Message.Type)
    }

    private let serviceProvider: AuroraServiceProvider
    private let messageQueue: AuroraMessageQueue
    private let eventLoop: EventLoop

    internal init(
        eventLoop: EventLoop,
        serviceProvider: AuroraServiceProvider,
        messageQueue: AuroraMessageQueue
    ) {
        self.eventLoop = eventLoop
        self.serviceProvider = serviceProvider
        self.messageQueue = messageQueue
    }

    func dispatch(context: ChannelHandlerContext, envelope: AuroraEnvelope) throws {
        if envelope.header.serviceID == ReplyService.id {
            return try dispatchResponse(context: context, envelope: envelope)
        } else {
            return try dispatchCall(context: context, envelope: envelope)
        }
    }

    private func dispatchCall(context: ChannelHandlerContext, envelope: AuroraEnvelope) throws {
        let service = try serviceProvider.inboundService(with: envelope.header.serviceHash)

        guard
            let method = try? type(of: service).method(with: envelope.header.methodID)
        else {
            throw Error.unknownMethod(service: service, methodId: envelope.header.methodID)
        }

        service
            .handle(method: method, request: envelope.message)
            .whenComplete { result in
                switch result {
                case .failure(let error):
                    context.fireErrorCaught(error)
                case .success(let reply):
                    // TODO: Figure out if this is the right way of handling this.
                    let _ = self.messageQueue.enqueue(reply: reply, to: envelope)
                }
            }
    }

    private func dispatchResponse(context: ChannelHandlerContext, envelope: AuroraEnvelope) throws {
        let (expectedMessageType, promise) = try messageQueue.dequeue(for: envelope.header.token)

        guard let message = envelope.message else {
            throw Error.missingResponeMessage
        }

        do {
            let receivedMessageType = type(of: message)

            guard expectedMessageType == receivedMessageType else {
                throw Error.unexpectedMessageType(expected: expectedMessageType, received: receivedMessageType)
            }

            promise.succeed(message)
        } catch {
            promise.fail(error)
        }
    }
}
