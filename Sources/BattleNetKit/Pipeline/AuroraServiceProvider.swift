import Foundation

internal final class AuroraServiceProvider {
    enum Error: Swift.Error {
        case unknownOutboundService(id: UInt32)
        case unknownInboundService(id: UInt32)
    }

    private var inboundServices: [UInt32: ServiceType] = [:]
    private var outboundServices: [UInt32: ServiceType] = [:]

    internal func outboundService(with id: UInt32) throws -> ServiceType {
        guard let service = self.outboundServices[id] else {
            throw Error.unknownOutboundService(id: id)
        }

        return service
    }

    internal func inboundService(with id: UInt32) throws -> ServiceType {
        guard let service = self.inboundServices[id] else {
            throw Error.unknownInboundService(id: id)
        }

        return service
    }

    internal func register(inbound service: ServiceType) throws {
        let hash = try type(of: service).hash()

        self.inboundServices[hash] = service
    }

    internal func register(outbound service: ServiceType) throws {
        let hash = try type(of: service).hash()

        self.outboundServices[hash] = service
    }
}
