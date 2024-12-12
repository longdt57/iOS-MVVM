//
//  ErrorState.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation

enum ErrorState {
    case none
    case message(title: String, message: String, primaryButton: String, secondaryButton: String?)
    
    static func common() -> ErrorState {
        return message(title: R.string.localizable.error_unknown_title(), message: R.string.localizable.error_unknown_message(), primaryButton: R.string.localizable.common_close(), secondaryButton: nil)
    }
    
    static func network() -> ErrorState {
        return message(title: R.string.localizable.error_no_internet_title(), message: R.string.localizable.error_no_internet_message(), primaryButton: R.string.localizable.common_close(), secondaryButton: nil)
    }
}
