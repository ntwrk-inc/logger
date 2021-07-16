import Darwin
import os

// MARK: - SysPrinter

open class SysPrinter: PrinterFormatter {
    // MARK: Lifecycle

    public init(modifiers: [LogFormatter] = []) {
        formatters = modifiers
    }

    // MARK: Open

    open func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        let type = sysLogPriority(logLevel)
        os_log("%s", log: .default, type: type, message)
    }

    // MARK: Public

    public let formatters: [LogFormatter]
}

extension SysPrinter {
    private func sysLogPriority(_ logLevel: LogLevel) -> OSLogType {
        switch logLevel {
        case .debug:
            return .debug
        case .info:
            return .info
        case .warn:
            return .default
        case .error:
            return .error
        default:
            return .default
        }
    }
}
