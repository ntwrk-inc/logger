import Foundation

/// Utility class that provides a disabled logger.
public final class MutedLogger: Logger {
    // MARK: Lifecycle

    public init(printers: [PrinterStrategy] = []) {
        super.init(logLevel: .off, printers: printers)
    }

    // MARK: Public

    public func log(_: String, logLevel _: LogLevel) {}
}
