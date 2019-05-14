import Foundation

class ConnectionAPI {}

protocol API {
    init(client: BattleNetClient)
    func bind(to connectionAPI: ConnectionAPI) throws
    func register(with connectionAPI: ConnectionAPI) throws
}
