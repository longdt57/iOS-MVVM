//
//  GitUserRepositoryImpl.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Resolver

final class GitUserRepositoryImpl : GitUserRepository {
    
    @Injected var networkAPI: NetworkAPIProtocol
    
    func getRemote(since: Int, perPage: Int) async throws -> [GitUserModel] {
        let configuration = GitUserConfiguration.getUsers(since: since, perPage: perPage)
        let gitUsers: [GitUser] = try await networkAPI.performRequest(configuration, for: [GitUser].self)
        return mapToDomain(gitUsers)
    }
    
    private func mapToDomain(_ users: [GitUser]) -> [GitUserModel] {
        return users.map { $0.mapToDomain() }
    }
}

