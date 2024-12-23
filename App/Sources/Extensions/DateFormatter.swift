//
//  DateFormatter.swift
// iOS MVVM
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


import Foundation

extension DateFormatter {
    
    static let monthDayYear = DateFormatter(with: "MMMM dd, yyyy")
    
    /// Support full iso8601 conversion.
    /// Formatted to local calendar.
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    convenience init(with format: String) {
        self.init()
        dateFormat = format
    }
}
