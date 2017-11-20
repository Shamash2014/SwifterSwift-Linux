//
// LinuxMain.swift
// SwifterSwift

import XCTest
@testable import SwiftStdLibTests

var tests = [XCTestCaseEntry]()
tests += SwiftStdLibTests.allTests()

XCTMain(tests)
