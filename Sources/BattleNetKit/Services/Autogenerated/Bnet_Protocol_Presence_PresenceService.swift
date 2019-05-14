import Foundation

class Bnet_Protocol_Presence_PresenceService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.presence.PresenceService"

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
        case Subscribe = 1
        case Unsubscribe = 2
        case Update = 3
        case Query = 4
        case Ownership = 5
        case SubscribeNotification = 7
        case BatchSubscribe = 8
        case BatchUnsubscribe = 9

        var name: String {
            switch self {
            case .Subscribe: return "Subscribe"
            case .Unsubscribe: return "Unsubscribe"
            case .Update: return "Update"
            case .Query: return "Query"
            case .Ownership: return "Ownership"
            case .SubscribeNotification: return "SubscribeNotification"
            case .BatchSubscribe: return "BatchSubscribe"
            case .BatchUnsubscribe: return "BatchUnsubscribe"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_NoData.self
            case .Unsubscribe: return Bgs_Protocol_NoData.self
            case .Update: return Bgs_Protocol_NoData.self
            case .Query: return Bgs_Protocol_Presence_V1_QueryResponse.self
            case .Ownership: return Bgs_Protocol_NoData.self
            case .SubscribeNotification: return Bgs_Protocol_NoData.self
            case .BatchSubscribe: return Bgs_Protocol_Presence_V1_BatchSubscribeResponse.self
            case .BatchUnsubscribe: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .Subscribe: return Bgs_Protocol_Presence_V1_SubscribeRequest.self
            case .Unsubscribe: return Bgs_Protocol_Presence_V1_UnsubscribeRequest.self
            case .Update: return Bgs_Protocol_Presence_V1_UpdateRequest.self
            case .Query: return Bgs_Protocol_Presence_V1_QueryRequest.self
            case .Ownership: return Bgs_Protocol_Presence_V1_OwnershipRequest.self
            case .SubscribeNotification: return Bgs_Protocol_Presence_V1_SubscribeNotificationRequest.self
            case .BatchSubscribe: return Bgs_Protocol_Presence_V1_BatchSubscribeRequest.self
            case .BatchUnsubscribe: return Bgs_Protocol_Presence_V1_BatchUnsubscribeRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
