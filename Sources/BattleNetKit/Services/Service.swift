import Foundation
import NIO

protocol MethodType {
    var id: UInt32 { get }
    var name: String { get }
    var requestType: Message.Type { get }
    var responseType: Message.Type { get }

    init?(id: UInt32)
}

extension MethodType where Self: RawRepresentable, Self.RawValue == Int {
    init?(id: UInt32) {
        self.init(rawValue: Int(id))
    }
}

protocol ServiceType {
    static var name: String { get }

    var eventLoop: EventLoop { get }

    static func method(with id: UInt32) throws -> MethodType

    func handle(method: MethodType, request: Message?) -> EventLoopFuture<Message>
}

enum ReplyService {
    static var id: UInt32 = 254
}

enum MethodTypeError: Swift.Error {
    case unknownMethod(method: UInt32)
    case unimplementedMethod
}

enum ServiceTypeError: Swift.Error {
    case unknownMethodForService(method: UInt32)
    case unableToCreateHashForName(name: String)
    case missingDelegateForService(service: ServiceType)
    case unexpectedMessageType(expected: Message.Type, received: Message?.Type)
    case unexpectedMethodType(expected: MethodType.Type, received: MethodType.Type)
    case outboundOnlyServiceReceivedAnInboundCall(service: ServiceType)
}

extension ServiceType {
    static func hash() throws -> UInt32 {
        var hash: UInt32 = 0x811c_9dc5
        guard let bytes = Self.name.data(using: .ascii, allowLossyConversion: false)?.bytes else {
            throw ServiceTypeError.unableToCreateHashForName(name: Self.name)
        }

        for byte in bytes {
            hash ^= UInt32(byte)
            hash = hash.multipliedReportingOverflow(by: 0x1000193).partialValue
        }

        return hash
    }

    func handle(method: MethodType, request: Message?) -> EventLoopFuture<Message> {
        return self.eventLoop.makeFailedFuture(ServiceTypeError.outboundOnlyServiceReceivedAnInboundCall(service: self))
    }
}
