//
//  UserResponse.swift
//  iOS MVVM
//
//  Created by Long Do on 14/12/2024.
//

import Foundation

struct UserResponse: Codable {
    let users : [User]
    
    enum CodingKeys: String, CodingKey {
        case users
    }
}
