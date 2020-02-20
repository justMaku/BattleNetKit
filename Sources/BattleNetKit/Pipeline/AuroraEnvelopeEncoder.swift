import Foundation
import NIO

internal final class AuroraEnvelopeEncoder: MessageToByteEncoder {
    typealias OutboundIn = AuroraEnvelope

    func encode(data: AuroraEnvelope, out: inout ByteBuffer) throws {
        Log.debug("Sending message:\n \(data)", domain: .aurora)

        let bytes = try data.encode()
        out.writeBytes(bytes)
    }
}
