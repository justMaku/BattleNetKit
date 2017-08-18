import XCTest
@testable import Ostara

enum Bit {
    case zero
    case one
}

class OstaraTests: XCTestCase {
    
    func unpackVarInt() {
        let bits: [Bit] = [.zero]
    }
    
    func testDebug() {
        do {
            let api = try BattleNet(region: .eu)
            try api.connect()
            print("Connected")
        } catch {
            print("Error occured")
        }
    }


    static var allTests : [(String, (OstaraTests) -> () throws -> Void)] {
        return [
            ("debug", testDebug),
        ]
    }
}
