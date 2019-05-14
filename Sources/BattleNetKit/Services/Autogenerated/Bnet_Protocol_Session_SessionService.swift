import Foundation

class Bnet_Protocol_Session_SessionService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.session.SessionService"

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
        case CreateSession = 1
        case DestroySession = 2
        case UpdateSession = 5
        case GetSessionCapacity = 6
        case GetSessionStateByBenefactor = 7
        case MarkSessionsAlive = 8
        case GetSessionState = 9
        case GetSignedSessionState = 10
        case RefreshSessionKey = 11

        var name: String {
            switch self {
            case .CreateSession: return "CreateSession"
            case .DestroySession: return "DestroySession"
            case .UpdateSession: return "UpdateSession"
            case .GetSessionCapacity: return "GetSessionCapacity"
            case .GetSessionStateByBenefactor: return "GetSessionStateByBenefactor"
            case .MarkSessionsAlive: return "MarkSessionsAlive"
            case .GetSessionState: return "GetSessionState"
            case .GetSignedSessionState: return "GetSignedSessionState"
            case .RefreshSessionKey: return "RefreshSessionKey"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .CreateSession: return Bgs_Protocol_Session_V1_CreateSessionResponse.self
            case .DestroySession: return Bgs_Protocol_NoData.self
            case .UpdateSession: return Bgs_Protocol_NoData.self
            case .GetSessionCapacity: return Bgs_Protocol_Session_V1_GetSessionCapacityResponse.self
            case .GetSessionStateByBenefactor: return Bgs_Protocol_Session_V1_GetSessionStateByBenefactorResponse.self
            case .MarkSessionsAlive: return Bgs_Protocol_Session_V1_MarkSessionsAliveResponse.self
            case .GetSessionState: return Bgs_Protocol_Session_V1_GetSessionStateResponse.self
            case .GetSignedSessionState: return Bgs_Protocol_Session_V1_GetSignedSessionStateResponse.self
            case .RefreshSessionKey: return Bgs_Protocol_Session_V1_RefreshSessionKeyResponse.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .CreateSession: return Bgs_Protocol_Session_V1_CreateSessionRequest.self
            case .DestroySession: return Bgs_Protocol_Session_V1_DestroySessionRequest.self
            case .UpdateSession: return Bgs_Protocol_Session_V1_UpdateSessionRequest.self
            case .GetSessionCapacity: return Bgs_Protocol_Session_V1_GetSessionCapacityRequest.self
            case .GetSessionStateByBenefactor: return Bgs_Protocol_Session_V1_GetSessionStateByBenefactorRequest.self
            case .MarkSessionsAlive: return Bgs_Protocol_Session_V1_MarkSessionsAliveRequest.self
            case .GetSessionState: return Bgs_Protocol_Session_V1_GetSessionStateRequest.self
            case .GetSignedSessionState: return Bgs_Protocol_Session_V1_GetSignedSessionStateRequest.self
            case .RefreshSessionKey: return Bgs_Protocol_Session_V1_RefreshSessionKeyRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
