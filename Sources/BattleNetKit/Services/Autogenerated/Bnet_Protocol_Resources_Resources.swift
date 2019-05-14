import Foundation

class Bnet_Protocol_Resources_Resources: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.resources.Resources"

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }

    static func handles(_ method: MethodType) -> Bool {
        return type(of: method) == Method.self
    }

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
            return UInt32(rawValue)
        }
    }
}
