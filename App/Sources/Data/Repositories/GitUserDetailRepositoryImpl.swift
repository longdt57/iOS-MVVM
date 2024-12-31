//
//  GitUserDetailRepositoryImpl.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Resolver

final class GitUserDetailRepositoryImpl : GitUserDetailRepository {
    
    @Injected var networkAPI: NetworkAPIProtocol
    @Injected var gitUserDetailLocalSource: GitUserDetailLocalSource
    
    func getRemote(userName: String) async throws -> GitUserDetailModel {
        let configuration = GitUserConfiguration.getUserDetail(username: userName)
        let user = try await networkAPI.performRequest(configuration, for: GitUserDetail.self)
//        saveToLocal(userDetail: user)
        return user.mapToDomain()
    }
    
    func getLocal(userName: String) async throws -> GitUserDetailModel? {
        return try await gitUserDetailLocalSource.getUserDetailByLogin(login: userName)?.mapToDomain()
    }
    
    func saveToLocal(userDetail: GitUserDetail) {
        gitUserDetailLocalSource.upsert(userDetail: userDetail)
    }
}
