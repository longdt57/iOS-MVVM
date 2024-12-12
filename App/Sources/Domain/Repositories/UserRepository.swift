//
//  UserRepository.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation

protocol UserRepository {
    
    func getUsers() async throws -> [User]
}
