//
//  GetUserUseCase.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation
import Resolver

class GetUserUseCase {
    
    @Injected var userRepository: UserRepository
    
    func invoke() async throws -> [User] {
        return try await userRepository.getUsers()
    }
}
