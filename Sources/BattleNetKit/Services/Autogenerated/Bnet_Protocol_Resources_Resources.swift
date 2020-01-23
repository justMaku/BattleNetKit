import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Resources_Resources: ServiceType {
    enum Method: Int, MethodType {
        case GetContentHandle = 1

        var name: String {
            switch self {
            case .GetContentHandle: return "GetContentHandle"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .GetContentHandle: return Bgs_Protocol_ContentHandle.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .GetContentHandle: return Bgs_Protocol_Resources_V1_ContentHandleRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.resources.Resources"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    init(eventLoop: EventLoop, messageQueue: AuroraMessageQueue) {
        self.eventLoop = eventLoop
        self.messageQueue = messageQueue
    }

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }
}

extension Bnet_Protocol_Resources_Resources {
    func GetContentHandle(request: Bgs_Protocol_Resources_V1_ContentHandleRequest) -> EventLoopFuture<Bgs_Protocol_ContentHandle> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.GetContentHandle))
    }
}
