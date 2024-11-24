//
//  LoadingState.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation

enum LoadingState {
    case none
    case loading(cancellable: Bool, message: String?)
}

extension LoadingState {
    // Computed property to get the message from the LoadingState
    var message: String? {
        switch self {
            case .none:
                return nil
            case .loading(_, let message):
                return message
        }
    }
}
