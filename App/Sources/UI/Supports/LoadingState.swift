//
//  LoadingState.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation

enum LoadingState {
    case none
    case loading(cancellable: Bool, message: String)
}
