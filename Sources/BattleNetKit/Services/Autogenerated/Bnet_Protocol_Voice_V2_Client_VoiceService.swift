import Foundation

class Bnet_Protocol_Voice_V2_Client_VoiceService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.voice.v2.client.VoiceService"

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
            return UInt32(rawValue)
        }
    }
}
