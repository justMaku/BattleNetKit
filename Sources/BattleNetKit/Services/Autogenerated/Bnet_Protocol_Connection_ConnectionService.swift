import Foundation
import NIO

class Bnet_Protocol_Connection_ConnectionService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.connection.ConnectionService"

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }

    static func handles(_ method: MethodType) -> Bool {
        return type(of: method) == Method.self
    }

    let messageQueue: AuroraMessageQueue

    init(messageQueue: AuroraMessageQueue) {
        self.messageQueue = messageQueue
    }

    func connect(
        request: Bgs_Protocol_Connection_V1_ConnectRequest
    ) -> EventLoopFuture<Bgs_Protocol_Connection_V1_ConnectResponse> {
        return messageQueue.enqueue(
            call: .init(
                message: request,
                service: self,
                method: Method.Connect
            )
        )
    }

    enum Method: Int, MethodType {
        case Connect = 1
        case Bind = 2
        case Echo = 3
        case ForceDisconnect = 4
        case KeepAlive = 5
        case Encrypt = 6
        case RequestDisconnect = 7

        var name: String {
            switch self {
            case .Connect: return "Connect"
            case .Bind: return "Bind"
            case .Echo: return "Echo"
            case .ForceDisconnect: return "ForceDisconnect"
            case .KeepAlive: return "KeepAlive"
            case .Encrypt: return "Encrypt"
            case .RequestDisconnect: return "RequestDisconnect"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Connect: return Bgs_Protocol_Connection_V1_ConnectResponse.self
            case .Bind: return Bgs_Protocol_Connection_V1_BindResponse.self
            case .Echo: return Bgs_Protocol_Connection_V1_EchoResponse.self
            case .ForceDisconnect: return Bgs_Protocol_NO_RESPONSE.self
            case .KeepAlive: return Bgs_Protocol_NO_RESPONSE.self
            case .Encrypt: return Bgs_Protocol_NoData.self
            case .RequestDisconnect: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Connect: return Bgs_Protocol_Connection_V1_ConnectRequest.self
            case .Bind: return Bgs_Protocol_Connection_V1_BindRequest.self
            case .Echo: return Bgs_Protocol_Connection_V1_EchoRequest.self
            case .ForceDisconnect: return Bgs_Protocol_Connection_V1_DisconnectNotification.self
            case .KeepAlive: return Bgs_Protocol_NoData.self
            case .Encrypt: return Bgs_Protocol_Connection_V1_EncryptRequest.self
            case .RequestDisconnect: return Bgs_Protocol_Connection_V1_DisconnectRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
