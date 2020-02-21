import Foundation
import SwiftProtobuf

public typealias Message = SwiftProtobuf.Message

struct AuroraEnvelope {
    enum Error: Swift.Error {
        case unexpectedNilMessage(packet: AuroraEnvelope)
        case unexpectedMessageType(type: Message.Type)
    }

    var header: Bgs_Protocol_Header
    let message: Message?

    func encode() throws -> Data {
        let headerData = try header.serializedData()
        let messageData = try message?.serializedData()

        let headerSize = headerData.count
        let sizeBytes: [UInt8] = [
            UInt8(headerSize) >> 8 & 255,
            UInt8(headerSize) & 255,
        ]

        let sizeData = Data(sizeBytes)

        return sizeData + headerData + (messageData ?? Data())
    }

    func extract<Response: Message>() throws -> Response {
        guard let message = self.message else {
            throw Error.unexpectedNilMessage(packet: self)
        }

        guard let casted = message as? Response else {
            throw Error.unexpectedMessageType(type: type(of: message))
        }

        return casted
    }
}
