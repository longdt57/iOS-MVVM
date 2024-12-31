//
//  GetGitUserDetailRemoteUseCase.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation
import Resolver

class GetGitUserDetailRemoteUseCase {
    
    @Injected var repository: GitUserDetailRepository
    
    func invoke(userName: String) async throws -> GitUserDetailModel {
        return try await repository.getRemote(userName: userName)
    }
}
