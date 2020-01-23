import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Report_ReportService: ServiceType {
    enum Method: Int, MethodType {
        case SendReport = 1
        case SubmitReport = 2

        var name: String {
            switch self {
            case .SendReport: return "SendReport"
            case .SubmitReport: return "SubmitReport"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .SendReport: return Bgs_Protocol_NoData.self
            case .SubmitReport: return Bgs_Protocol_NoData.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .SendReport: return Bgs_Protocol_Report_V1_SendReportRequest.self
            case .SubmitReport: return Bgs_Protocol_Report_V1_SubmitReportRequest.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.report.ReportService"

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

extension Bnet_Protocol_Report_ReportService {
    func SendReport(request: Bgs_Protocol_Report_V1_SendReportRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SendReport))
    }

    func SubmitReport(request: Bgs_Protocol_Report_V1_SubmitReportRequest) -> EventLoopFuture<Bgs_Protocol_NoData> {
        return self.messageQueue.enqueue(call: .init(message: request, service: self, method: Method.SubmitReport))
    }
}
