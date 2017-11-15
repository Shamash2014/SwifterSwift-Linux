//
//  BoolExtensions.swift
//  SwifterSwift-Linux
//
//  Created by Omar Albeik on 7/18/17.
//
//
#if os(Linux)
  import Glibc
#else
  import Darwin.C
#endif
import Foundation

// MARK: - Properties
public extension Bool {

	  /// SwifterSwift: Return 1 if true, or 0 if false.
	  public var int: Int {
		    return self ? 1 : 0
	  }

	  /// SwifterSwift: Return "true" if true, or "false" if false.
	  public var string: String {
		    return description
	  }

	  /// SwifterSwift: Return inversed value of bool.
	  public var toggled: Bool {
		    return !self
	  }

    /// SwifterSwift: Returns a random boolean value.
    ///
    ///     Bool.random -> true
    ///     Bool.random -> false
    ///
    public static var rand: Bool {
        let current = Date().timeIntervalSinceReferenceDate
        let salt = current.truncatingRemainder(dividingBy: 1) * 100000000
        srand(UInt32(current + salt))
        return random() % 2 == 1
    }
}

// MARK: - Methods
public extension Bool {
	  /// SwifterSwift: Toggle value for bool.
	  ///
	  /// - Returns: inversed value of bool.
	  @discardableResult public mutating func toggle() -> Bool {
		    self = !self
		    return self
	  }

}
