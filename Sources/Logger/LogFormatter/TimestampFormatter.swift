import Foundation

/// The `TimestampFormatter` adding timestamp to the log message.
open class TimestampFormatter: LogFormatter {
    // MARK: Lifecycle

    public init() {}

    // MARK: Open

    open func format(message: String, with _: LogLevel) -> String {
        let timestamp = DateFormatter.ddMMyyyyHHmmss.string(from: Date())
        return "\(timestamp) \(message)"
    }
}
