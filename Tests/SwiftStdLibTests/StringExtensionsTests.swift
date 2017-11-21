import XCTest
@testable import SwifterSwift_Linux

final class StringExtensionsTests: XCTestCase {
    static var allTests = [
      ("testBase64Decoded", testBase64Decoded),
      ("testBase64Encoded", testBase64Encoded),
      ("testCharactersArray", testCharactersArray),
      ("testCamelCased", testCamelCased),
      ("testCamelize", testCamelize)
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
}
