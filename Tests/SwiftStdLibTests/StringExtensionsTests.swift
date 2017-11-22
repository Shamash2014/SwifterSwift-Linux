import XCTest
@testable import SwifterSwift_Linux

final class StringExtensionsTests: XCTestCase {
    static var allTests = [
      ("testBase64Decoded", testBase64Decoded),
      ("testBase64Encoded", testBase64Encoded),
      ("testCharactersArray", testCharactersArray),
      ("testCamelCased", testCamelCased),
      ("testCamelize", testCamelize),
      ("testContain", testContain),
      ("testContainEmoji", testContainEmoji),
      ("testCount", testCount),
      ("testEnd", testEnd)
    ]

	  override func setUp() {
		    super.setUp()
		    NSTimeZone.default = NSTimeZone.system
	  }

	  func testBase64Decoded() {
		    XCTAssertEqual("SGVsbG8gV29ybGQh".base64Decoded, "Hello World!")
		    XCTAssertNil("hello".base64Decoded)
	  }

	  func testBase64Encoded() {
		    XCTAssertEqual("Hello World!".base64Encoded, "SGVsbG8gV29ybGQh")
	  }

    func testCharactersArray() {
		    let str = "Swift"
		    let chars = [Character("S"), Character("w"), Character("i"), Character("f"), Character("t")]
		    XCTAssertEqual(str.charactersArray, chars)
	  }

	  func testCamelCased() {
		    XCTAssertEqual("Hello test".camelCased, "helloTest")
		    XCTAssertEqual("Hellotest".camelCased, "hellotest")
	  }

	  func testCamelize() {
		    var str = "Hello test"
		    str.camelize()
		    XCTAssertEqual(str, "helloTest")
	  }

    func testContain() {
		    XCTAssert("Hello Tests".contains("Hello", caseSensitive: true))
		    XCTAssert("Hello Tests".contains("hello", caseSensitive: false))
	  }

	  func testContainEmoji() {
		    XCTAssert("Hello 😂".containEmoji)
		    XCTAssertFalse("Hello ;)".containEmoji)
	  }

	  func testCount() {
		    XCTAssertEqual("Hello This Tests".count(of: "T"), 2)
		    XCTAssertEqual("Hello This Tests".count(of: "t"), 1)
		    XCTAssertEqual("Hello This Tests".count(of: "T", caseSensitive: false), 3)
		    XCTAssertEqual("Hello This Tests".count(of: "t", caseSensitive: false), 3)

	  }

	  func testEnd() {
		    XCTAssert("Hello Test".ends(with: "test", caseSensitive: false))
		    XCTAssert("Hello Tests".ends(with: "sts"))
	  }

}
