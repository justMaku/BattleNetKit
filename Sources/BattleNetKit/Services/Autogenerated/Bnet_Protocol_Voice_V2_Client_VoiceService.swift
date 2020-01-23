import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Voice_V2_Client_VoiceService: ServiceType {
    enum Method: Int, MethodType {
        case CreateLoginCredentials = 1

        var name: String {
            switch self {
            case .CreateLoginCredentials: return "CreateLoginCredentials"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .CreateLoginCredentials: return Bgs_Protocol_Voice_V2_Client_CreateLoginCredentialsResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .CreateLoginCredentials: return Bgs_Protocol_Voice_V2_Client_CreateLoginCredentialsRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.voice.v2.client.VoiceService"

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

extension Bnet_Protocol_Voice_V2_Client_VoiceService {
    func CreateLoginCredentials(request: Bgs_Protocol_Voice_V2_Client_CreateLoginCredentialsRequest) -> EventLoopFuture<Bgs_Protocol_Voice_V2_Client_CreateLoginCredentialsResponse> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.CreateLoginCredentials))
    }
}
