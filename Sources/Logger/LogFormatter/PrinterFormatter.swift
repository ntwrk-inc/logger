import Foundation

// MARK: - PrinterFormatter

/// Specifies the format to be used in the log message
public protocol PrinterFormatter: PrinterStrategy {
    var formatters: [LogFormatter] { get }
}

extension PrinterFormatter {
    /// Format the message using formatting rules.
    ///
    /// - Parameters:
    ///   - message: A `String` value that contains the message.
    ///   - logLevel: A `LogLevel` value that contains the logging level.
    ///
    /// - Returns: Formatted message.
    func formatMessage(_ message: String, logLevel: LogLevel) -> String {
        var message = message
        formatters.forEach { message = $0.format(message: message, with: logLevel) }
        return message
    }
}
