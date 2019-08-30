import Foundation
import NIO

protocol API {
    func bind(to connectionAPI: ConnectionAPI) throws
    func register(with connectionAPI: ConnectionAPI) throws
}
