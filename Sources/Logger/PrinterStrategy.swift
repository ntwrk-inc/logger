public protocol PrinterStrategy {
    var formatters: [LogFormatter] { get }

    /// Log message.
    ///
    /// - Parameters:
    ///   - message: A `String` value that contains the message to dispatch.
    ///   - logLevel: A `LogLevel` value that contains the logging level.
    func log(_ message: String, logLevel: LogLevel)
}
