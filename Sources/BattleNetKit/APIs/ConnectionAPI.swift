import Foundation
import NIO

public class ConnectionAPI: API {
//    struct Handler {
//        let service: UInt32
//        let method: UInt32
//        let closure: (_ packet: Packet) throws -> Void
//    }

    private let connectionService = Bnet_Protocol_Connection_ConnectionService()
    private let replyService = ReplyService()
    private let channel: Channel

    required init(channel: Channel) {
        self.channel = channel
    }

    func bind(to _: ConnectionAPI) throws {}

    func register(with _: ConnectionAPI) throws {}
}
