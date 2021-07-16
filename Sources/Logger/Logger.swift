import Foundation

open class Logger {
    // MARK: Lifecycle

    /// Initializes a `Logger` instance.
    ///
    /// - Parameters:
    ///   - logLevel: The message level that should be logged to the printers.
    ///   - printers: Array of printers that messages should be sent to.
    public init(
        logLevel: LogLevel,
        printers: [PrinterStrategy]
    ) {
        self.logLevel = logLevel
        self.printers = printers
    }

    // MARK: Open

    /// Dispatches the given message using the logger if the debug log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    open func debug(message: @autoclosure () -> String) {
        log(message(), logLevel: .debug)
    }

    /// Dispatches the given message using the logger if the info log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    open func info(message: @autoclosure () -> String) {
        log(message(), logLevel: .info)
    }

    /// Dispatches the given message using the logger if the warning log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    open func warning(message: @autoclosure () -> String) {
        log(message(), logLevel: .warn)
    }

    /// Dispatches the given message using the logger if the error log level is set.
    ///
    /// - Parameter message: An autoclosure returning the message to log.
    open func error(message: @autoclosure () -> String) {
        log(message(), logLevel: .error)
    }

    // MARK: Public

    /// A logger that does not output any messages to printers.
    public static let mute: Logger = MutedLogger()

    /// Log level this blabber is configured for.
    public let logLevel: LogLevel
    /// The array of printers to use when messages are dispatched.
    public let printers: [PrinterStrategy]

    // MARK: Private

    /// Passes the message to each receiver's printer.
    ///
    /// - Parameters:
    ///   - message: The message to dispatch.
    ///   - logLevel: The message's level.
    private func log(_ message: String, logLevel: LogLevel) {
        guard isLoggerEnabled(for: logLevel) else {
            return
        }

        printers.forEach { $0.log(message, logLevel: logLevel) }
    }

    /// Checks if the given `LogLevel` is allowed by the reciever.
    ///
    /// - Parameter logLevel: The log level to check.
    private func isLoggerEnabled(for logLevel: LogLevel) -> Bool {
        self.logLevel.contains(logLevel)
    }
}
