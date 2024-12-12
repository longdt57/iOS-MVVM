//
//  ErrorState.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation

enum ErrorState {
    case none
    case message(title: String, message: String, primaryButton: String, secondaryButton: String)
    
//    static func common() -> ErrorState {
//        return message(title: <#T##String#>, message: <#T##String#>, primaryButton: <#T##String#>, secondaryButton: <#T##String#>)
//    }
}
