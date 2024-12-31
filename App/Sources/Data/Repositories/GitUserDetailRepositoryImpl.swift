//
//  GitUserDetailRepositoryImpl.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Resolver

final class GitUserDetailRepositoryImpl : GitUserDetailRepository {
    
    @Injected var networkAPI: NetworkAPIProtocol
    
    func getRemote(userName: String) async throws -> GitUserDetailModel {
        try await networkAPI.performRequest(
            GitUserConfiguration.getUserDetail(username: userName),
            for: GitUserDetail.self
        ).mapToDomain()
    }
}
