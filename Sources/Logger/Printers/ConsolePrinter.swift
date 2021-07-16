import Foundation

public class ConsolePrinter: PrinterFormatter {
    // MARK: Lifecycle

    public init(modifiers: [LogFormatter] = []) {
        formatters = modifiers
    }

    // MARK: Open

    open func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        print(message)
    }

    // MARK: Public

    public let formatters: [LogFormatter]
}
