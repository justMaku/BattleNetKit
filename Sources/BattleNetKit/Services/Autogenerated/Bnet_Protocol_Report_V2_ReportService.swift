import Foundation

class Bnet_Protocol_Report_V2_ReportService: ServiceType {
    var id: UInt32?
    static let name = "bnet.protocol.report.v2.ReportService"

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
        case SubmitReport = 1

        var name: String {
            switch self {
            case .SubmitReport: return "SubmitReport"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .SubmitReport: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .SubmitReport: return Bgs_Protocol_Report_V2_SubmitReportRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(rawValue)
        }
    }
}
