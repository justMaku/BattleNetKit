import XCTest
@testable import BattleNetKit

final class BattleNetKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BattleNetKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
