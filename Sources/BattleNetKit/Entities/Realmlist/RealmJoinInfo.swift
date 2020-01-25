import Foundation

public struct RealmJoinInfo {
    public let addresses: [Address]
    public let joinTicket: Data
    public let joinSecret: Data
}
