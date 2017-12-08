//
//  StringExtensions.swift
//  SwifterSwift-Linux
//
//  Created by Omar Albeik on 7/18/17.
//
//

import Foundation
#if os(Linux)
	import Glibc
#else
	import Darwin.C
#endif


// MARK: - Properties
public extension String {

	/// SwifterSwift: String decoded from base64 (if applicable).
	public var base64Decoded: String? {
		// https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
		guard let decodedData = Data(base64Encoded: self) else {
			return nil
		}
		return String(data: decodedData, encoding: .utf8)
	}

	/// SwifterSwift: String encoded in base64 (if applicable).
	public var base64Encoded: String? {
		// https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
		let plainData = data(using: .utf8)
		return plainData?.base64EncodedString()
	}

	/// SwifterSwift: Array of characters of a string.
	public var charactersArray: [Character] {
		return Array(characters)
	}

	/// SwifterSwift: CamelCase of string.
	public var camelCased: String {

      let source = lowercased()
		  let first = source[..<source.index(after: source.startIndex)]
		  if source.contains(" ") {
			    let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
			    let camel = connected.replacingOccurrences(of: "\n", with: "")
			    let rest = String(camel.dropFirst())
			    return first + rest
		  }
		  let rest = String(source.dropFirst())
		  return first + rest
	}

	/// SwifterSwift: Converts string format to CamelCase.
	///
	///		var str = "sOme vaRiabLe Name"
	///		str.camelize()
	///		print(str) // prints "someVariableName"
	///

  public mutating func camelize() {
		  self = camelCased
	}

	/// SwifterSwift: Check if string contains one or more emojis.
	///
	///		"Hello 😀".containEmoji -> true
	///
	public var containEmoji: Bool {
		  // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
		  for scalar in unicodeScalars {
			    switch scalar.value {
			    case 0x3030, 0x00AE, 0x00A9, // Special Characters
			         0x1D000...0x1F77F, // Emoticons
			         0x2100...0x27BF, // Misc symbols and Dingbats
			         0xFE00...0xFE0F, // Variation Selectors
			         0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
				      return true
			    default:
				      continue
			    }
		  }
		  return false
	}
	
	/// SwifterSwift: First character of string (if applicable).
	///
	///		"Hello".firstCharacterAsString -> Optional("H")
	///		"".firstCharacterAsString -> nil
	///
	public var firstCharacterAsString: String? {
		  guard let first = self.first else {
			    return nil
		  }
		  return String(first)
	}

	/// SwifterSwift: Check if string contains one or more letters.
	public var hasLetters: Bool {
		return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
	}

	/// SwifterSwift: Check if string contains one or more s.
	public var hasNumbers: Bool {
		return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
	}

	/// SwifterSwift: Check if string contains only letters.
	public var isAlphabetic: Bool {
		return hasLetters && !hasNumbers
	}

  public var isEmail: Bool {
		  // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
		  return matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
	}

  // SwifterSwift: Verify if string matches the regex pattern.
	///
	/// - Parameter pattern: Pattern to verify.
	/// - Returns: true if string matches the pattern.

  public func matches(pattern: String) -> Bool {
		  return range(of: pattern,
		               options: String.CompareOptions.regularExpression,
		               range: nil, locale: nil) != nil
	}

	/// SwifterSwift: Check if string contains at least one letter and one number.
	public var isAlphaNumeric: Bool {
		return components(separatedBy: CharacterSet.alphanumerics).joined(separator: "").characters.count == 0 && hasLetters && hasNumbers
	}

	/// SwifterSwift: Check if string is a valid URL.
	public var isValidUrl: Bool {
		return URL(string: self) != nil
	}

	/// SwifterSwift: Check if string is a valid schemed URL.
	public var isValidSchemedUrl: Bool {
		guard let url = URL(string: self) else {
			return false
		}
		return url.scheme != nil
	}

	/// SwifterSwift: Check if string is a valid https URL.
	public var isValidHttpsUrl: Bool {
		guard let url = URL(string: self) else {
			return false
		}
		return url.scheme == "https"
	}

	/// SwifterSwift: Check if string is a valid http URL.
	public var isValidHttpUrl: Bool {
		guard let url = URL(string: self) else {
			return false
		}
		return url.scheme == "http"
	}

	/// SwifterSwift: Check if string is a valid file URL.
	public var isValidFileUrl: Bool {
		return URL(string: self)?.isFileURL ?? false
	}

	/// SwifterSwift: Check if string contains only numbers.
	public var isNumeric: Bool {
		return  !hasLetters && hasNumbers
	}

	/// SwifterSwift: Last character of string (if applicable).
	public var lastCharacter: String? {
		guard let last = characters.last else {
			return nil
		}
		return String(last)
	}

	/// SwifterSwift: Latinized string.
	public var latinized: String {
		return folding(options: .diacriticInsensitive, locale: Locale.current)
	}

	/// SwifterSwift: Number of characters in string.
	public var length: Int {
		return characters.count
	}

	/// SwifterSwift: Array of strings separated by new lines.
	public var lines: [String] {
		var result = [String]()
		enumerateLines { line, _ in
			result.append(line)
		}
		return result
	}

	/// SwifterSwift: The most common character in string.
	public var mostCommonCharacter: String {
		let mostCommon = withoutSpacesAndNewLines.characters.reduce([Character: Int]()) {
			var counts = $0
			counts[$1] = ($0[$1] ?? 0) + 1
			return counts
			}.max { $0.1 < $1.1 }?.0
		guard let char = mostCommon else {
			return ""
		}
		return String(char)
	}

	/// SwifterSwift: Reversed string.
	public var reversed: String {
		return String(characters.reversed())
	}

	/// SwifterSwift: Bool value from string (if applicable).
	public var bool: Bool? {
		let selfLowercased = trimmed.lowercased()
		if selfLowercased == "true" || selfLowercased == "1" {
			return true
		} else if selfLowercased == "false" || selfLowercased == "0" {
			return false
		}
		return nil
	}

	/// SwifterSwift: Date object from "yyyy-MM-dd" formatted string
	public var date: Date? {
		let selfLowercased = trimmed.lowercased()
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd"
		return formatter.date(from: selfLowercased)
	}

	/// SwifterSwift: Date object from "yyyy-MM-dd HH:mm:ss" formatted string.
	public var dateTime: Date? {
		let selfLowercased = trimmed.lowercased()
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return formatter.date(from: selfLowercased)
	}

	/// SwifterSwift: Integer value from string (if applicable).
	public var int: Int? {
		return Int(self)
	}

	/// SwifterSwift: Int16 value from string (if applicable).
	public var int16: Int16? {
		return Int16(self)
	}

	/// SwifterSwift: Int32 value from string (if applicable).
	public var int32: Int32? {
		return Int32(self)
	}

	/// SwifterSwift: Int64 value from string (if applicable).
	public var int64: Int64? {
		return Int64(self)
	}

	/// SwifterSwift: Int8 value from string (if applicable).
	public var int8: Int8? {
		return Int8(self)
	}

	/// SwifterSwift: URL from string (if applicable).
	public var url: URL? {
		return URL(string: self)
	}

	/// SwifterSwift: String with no spaces or new lines in beginning and end.
	public var trimmed: String {
		return trimmingCharacters(in: .whitespacesAndNewlines)
	}

	/// SwifterSwift: Array with unicodes for all characters in a string.
	public var unicodeArray: [Int] {
		return unicodeScalars.map({$0.hashValue})
	}

	/// SwifterSwift: Readable string from a URL string.
	public var urlDecoded: String {
		return removingPercentEncoding ?? self
	}

	/// SwifterSwift: URL escaped string.
	public var urlEncoded: String {
		return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}

	/// SwifterSwift: String without spaces and new lines.
	public var withoutSpacesAndNewLines: String {
		return replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
	}

  /// SwifterSwift: Check if string contains one or more instance of substring.
	///
	///		"Hello World!".contain("O") -> false
	///		"Hello World!".contain("o", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string contains one or more instance of substring.
	public func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
		  if !caseSensitive {
			    return range(of: string, options: .caseInsensitive) != nil
		  }
		  return range(of: string) != nil
	}

  /// SwifterSwift: Check if string ends with substring.
	///
	///		"Hello World!".ends(with: "!") -> true
	///		"Hello World!".ends(with: "WoRld!", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - suffix: substring to search if string ends with.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string ends with substring.
	public func ends(with suffix: String, caseSensitive: Bool = true) -> Bool {
		  if !caseSensitive {
			    return lowercased().hasSuffix(suffix.lowercased())
		  }
		  return hasSuffix(suffix)
	}

	/// SwifterSwift: Count of substring in string.
	///
	///		"Hello World!".count(of: "o") -> 2
	///		"Hello World!".count(of: "L", caseSensitive: false) -> 3
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: count of appearance of substring in string.
	public func count(of string: String, caseSensitive: Bool = true) -> Int {
		  if !caseSensitive {
			    return lowercased().components(separatedBy: string.lowercased()).count - 1
		  }
		  return components(separatedBy: string).count - 1
	}
}
