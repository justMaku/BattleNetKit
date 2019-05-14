import Foundation

class Bnet_Protocol_Diag_DiagService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.diag.DiagService"

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
        case GetVar = 1
        case SetVar = 2
        case Query = 3

        var name: String {
            switch self {
            case .GetVar: return "GetVar"
            case .SetVar: return "SetVar"
            case .Query: return "Query"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .GetVar: return Bgs_Protocol_Diag_V1_GetVarResponse.self
            case .SetVar: return Bgs_Protocol_NoData.self
            case .Query: return Bgs_Protocol_Diag_V1_QueryResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .GetVar: return Bgs_Protocol_Diag_V1_GetVarRequest.self
            case .SetVar: return Bgs_Protocol_Diag_V1_SetVarRequest.self
            case .Query: return Bgs_Protocol_Diag_V1_QueryRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
