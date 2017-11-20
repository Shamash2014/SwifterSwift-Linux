import XCTest

    // On Linux there is no Objective-C runtime, so need to tell XCTest where to find tests cases by hand
public func allTests() -> [XCTestCaseEntry] {
        return [
          testCase(BoolExtensionsTests.allTests),
          testCase(StringExtensionsTests.allTests),
        ]
}
