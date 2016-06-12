import XCTest
@testable import ChannelStream

class ChannelStreamTests: XCTestCase {
    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }
}

extension ChannelStreamTests {
    static var allTests : [(String, (ChannelStreamTests) -> () throws -> Void)] {
        return [
           ("testReality", testReality),
        ]
    }
}
