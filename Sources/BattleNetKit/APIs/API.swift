import Foundation
import NIO

protocol API {
    init(channel: Channel)
    func bind(to connectionAPI: ConnectionAPI) throws
    func register(with connectionAPI: ConnectionAPI) throws
}
