#if os(Linux)

import XCTest
@testable import ChannelStreamTestSuite

XCTMain([
    testCase(ChannelStreamTests.allTests)
])

#endif
