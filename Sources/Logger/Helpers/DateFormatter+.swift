import Foundation

extension DateFormatter {
    /// Build `DateFormatter` with `dd-MM-yyyy HH:mm:ss.SSS` date format.
    ///
    /// - Returns: An instance of `DateFormatter`.
    static var ddMMyyyyHHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
        return formatter
    }()
}
