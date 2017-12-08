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
      ("testEnd", testEnd),
      ("testFirstCharacter", testFirstCharacter),
	    ("testHasLetters", testHasLetters),
	    ("testHasNumbers", testHasNumbers),
	    ("testIsAlphabetic", testIsAlphabetic)
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

    func testFirstCharacter() {
		    XCTAssertNil("".firstCharacterAsString)
		    XCTAssertNotNil("Hello".firstCharacterAsString)
		    XCTAssertEqual("Hello".firstCharacterAsString, "H")
	  }

	  func testHasLetters() {
		    XCTAssert("hsj 1 wq3".hasLetters)
		    XCTAssertFalse("123".hasLetters)
		    XCTAssert("Hello test".hasLetters)
	  }

	  func testHasNumbers() {
		    XCTAssert("hsj 1 wq3".hasNumbers)
		    XCTAssert("123".hasNumbers)
		    XCTAssertFalse("Hello test".hasNumbers)
	  }

	  func testIsAlphabetic() {
		    XCTAssert("abc".isAlphabetic)
		    XCTAssertFalse("123abc".isAlphabetic)
		    XCTAssertFalse("123".isAlphabetic)
	  }


    func testIsAlphaNumeric() {
        XCTAssert("123abc".isAlphaNumeric)
        XCTAssertFalse("123".isAlphaNumeric)
        XCTAssertFalse("abc".isAlphaNumeric)
      }

      func testIsEmail() {
        XCTAssert("omaralbeik@gmail.com".isEmail)
        XCTAssertFalse("omaralbeik@gmailcom".isEmail)
        XCTAssertFalse("omaralbeikgmail.com".isEmail)
      }

      func testIsValidUrl() {
        XCTAssert("https://google.com".isValidUrl)
        XCTAssert("http://google.com".isValidUrl)
        XCTAssert("ftp://google.com".isValidUrl)
      }

      func testIsValidSchemedUrl() {
        XCTAssertFalse("Hello world!".isValidSchemedUrl)
        XCTAssert("https://google.com".isValidSchemedUrl)
        XCTAssert("ftp://google.com".isValidSchemedUrl)
        XCTAssertFalse("google.com".isValidSchemedUrl)
      }

      func testIsValidHttpsUrl() {
        XCTAssertFalse("Hello world!".isValidHttpsUrl)
        XCTAssert("https://google.com".isValidHttpsUrl)
        XCTAssertFalse("http://google.com".isValidHttpsUrl)
        XCTAssertFalse("google.com".isValidHttpsUrl)
      }

      func testIsValidHttpUrl() {
        XCTAssertFalse("Hello world!".isValidHttpUrl)
        XCTAssert("http://google.com".isValidHttpUrl)
        XCTAssertFalse("google.com".isValidHttpUrl)
      }
}
