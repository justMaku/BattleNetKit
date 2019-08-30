internal final class AuroraEnvelopeResolver {
    enum Error: Swift.Error {
        case errorStatus(status: BattleNetStatus)
        case unknownStatus(status: UInt32)
        case unknownMethod(service: ServiceType, methodId: UInt32)
        case messageExpected
    }

    private let serviceProvider: AuroraServiceProvider
    private let messageQueue: AuroraMessageQueue

    internal init(serviceProvider: AuroraServiceProvider, messageQueue: AuroraMessageQueue) {
        self.serviceProvider = serviceProvider
        self.messageQueue = messageQueue
    }

    public func resolve(envelope: UnresolvedAuroraEnvelope) throws -> AuroraEnvelope {
        if envelope.header.status != BattleNetStatus.ok.rawValue {
            guard let status = BattleNetStatus(rawValue: Int64(envelope.header.status)) else {
                throw Error.unknownStatus(status: envelope.header.status)
            }

            throw Error.errorStatus(status: status)
        }

        if envelope.header.serviceID == ReplyService.id {
            return try resolveResponse(envelope: envelope)
        } else {
            return try resolveCall(envelope: envelope)
        }
    }

    private func resolveCall(envelope: UnresolvedAuroraEnvelope) throws -> AuroraEnvelope {
        let service = try serviceProvider.inboundService(with: envelope.header.serviceID)

        guard let method = try? type(of: service).method(with: envelope.header.methodID) else {
            throw Error.unknownMethod(service: service, methodId: envelope.header.methodID)
        }

        if method.requestType == Bgs_Protocol_NoData.self {
            return AuroraEnvelope(header: envelope.header, message: nil)
        }

        guard let buffer = envelope.messageBytes?.getBytes(at: 0, length: Int(envelope.header.size)) else {
            throw Error.messageExpected
        }

        let message = try method.requestType.init(serializedData: .init(buffer))

        return AuroraEnvelope(header: envelope.header, message: message)
    }

    func resolveResponse(envelope: UnresolvedAuroraEnvelope) throws -> AuroraEnvelope {
        let (messageType, _) = try messageQueue.dequeue(for: envelope.header.token)

        guard let buffer = envelope.messageBytes?.getBytes(at: 0, length: Int(envelope.header.size)) else {
            throw Error.messageExpected
        }

        let message = try messageType.init(serializedData: .init(buffer))

        return AuroraEnvelope(header: envelope.header, message: message)
    }
}
