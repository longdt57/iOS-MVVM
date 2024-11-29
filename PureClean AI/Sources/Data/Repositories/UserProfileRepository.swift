//
//  UserProfileRepository.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//

import Resolver

final class UserProfileRepository {

    @Injected var networkAPI: NetworkAPIProtocol
    @Injected var keychain: KeychainProtocol
    
    func fetchUserProfile() async -> [User] {
        return networkAPI.performRequest(UserConfiguration.getUsers, for: [User].self)
    }
}
