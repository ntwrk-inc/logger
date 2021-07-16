import XCTest

@testable import Logger

final class TimestampFormatterTests: XCTestCase {
    func testThatItFormatsMessageAsExpected() {
        let formatter = TimestampFormatter()
        let message = "Test message"
        let logLevels: [LogLevel] = [.error, .warn, .debug, .info]

        let actualMessages = logLevels.map { formatter.format(message: message, with: $0) }

        for (index, _) in logLevels.enumerated() {
            let actualMessage = actualMessages[index]
            let expectedSuffix = " \(message)"
            XCTAssertTrue(actualMessage.hasSuffix(expectedSuffix), "Actual message should contain expected suffix")
            XCTAssertEqual(actualMessage.count, 36, "Actual message 36 characters")
        }
    }
}
