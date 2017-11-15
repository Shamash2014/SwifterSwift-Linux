import XCTest

public struct SwiftStdLibTests {
    // On Linux there is no Objective-C runtime, so need to tell XCTest where to find tests cases by hand
    static var allTests = []
      + BoolExtensionsTests.allTests
 }
