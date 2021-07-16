import XCTest

@testable import Logger

final class LogLevelTests: XCTestCase {
    func testThatLogLevelHasCorrectRawValues() {
        XCTAssertEqual(LogLevel.off.rawValue, 1)
        XCTAssertEqual(LogLevel.debug.rawValue, 2)
        XCTAssertEqual(LogLevel.info.rawValue, 4)
        XCTAssertEqual(LogLevel.warn.rawValue, 8)
        XCTAssertEqual(LogLevel.error.rawValue, 16)
        XCTAssertEqual(LogLevel.all.rawValue, 0b1111_1111_1111_1111_1111_1111_1111_1111)
    }

    func testThatLogLevelHasCorrectDescription() {
        XCTAssertEqual(LogLevel.off.description, "off")
        XCTAssertEqual(LogLevel.debug.description, "debug")
        XCTAssertEqual(LogLevel.info.description, "info")
        XCTAssertEqual(LogLevel.warn.description, "warn")
        XCTAssertEqual(LogLevel.error.description, "error")
        XCTAssertEqual(LogLevel.all.description, "all")
    }
}
