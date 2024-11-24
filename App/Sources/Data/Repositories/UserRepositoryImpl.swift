//
//  UserProfileRepository.swift
// iOS MVVM
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//

import Resolver

final class UserRepositoryImpl : UserRepository {

    @Injected var networkAPI: NetworkAPIProtocol
    @Injected var keychain: KeychainProtocol
    
    func getUsers() async throws -> [User] {
        try await networkAPI.performRequest(UserConfiguration.getUsers, for: UserResponse.self).users
    }
}
