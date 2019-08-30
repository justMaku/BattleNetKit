import Foundation
import NIO

struct UnresolvedAuroraEnvelope {
    let header: Bgs_Protocol_Header
    let messageBytes: ByteBuffer?
}

internal final class AuroraEnvelopeDecoder: ByteToMessageDecoder {
    typealias InboundIn = ByteBuffer
    typealias InboundOut = UnresolvedAuroraEnvelope

    func decode(context: ChannelHandlerContext, buffer: inout ByteBuffer) throws -> DecodingState {
        guard let (header, messageBuffer) = try self.unpack(buffer: &buffer) else {
            return .needMoreData
        }

        let envelope = UnresolvedAuroraEnvelope(header: header, messageBytes: messageBuffer)

        context.fireChannelRead(wrapInboundOut(envelope))

        return .continue
    }

    func decodeLast(context: ChannelHandlerContext, buffer: inout ByteBuffer, seenEOF _: Bool) throws -> DecodingState {
        while try decode(context: context, buffer: &buffer) == .continue {}

        return .needMoreData
    }

    private func unpack(buffer: inout ByteBuffer) throws -> (header: Bgs_Protocol_Header, messageBuffer: ByteBuffer)? {
        let headerSizeLength = 2

        guard let headerSizeBytes = buffer.readBytes(length: headerSizeLength) else {
            return nil
        }

        let headerSize = Int(headerSizeBytes[0] << 8 | headerSizeBytes[1])

        guard let headerBytes = buffer.readBytes(length: headerSize) else {
            return nil
        }

        let header = try Bgs_Protocol_Header(serializedData: .init(headerBytes))

        guard let messageBuffer = buffer.readSlice(length: Int(header.size)) else {
            return nil
        }

        return (
            header: header,
            messageBuffer: messageBuffer
        )
    }
}
