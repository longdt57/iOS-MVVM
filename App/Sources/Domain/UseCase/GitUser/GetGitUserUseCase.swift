//
//  GetGitUserRemoteUseCase.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation
import Combine
import Resolver

class GetGitUserUseCase {
    
    @Injected var repository: GitUserRepository
    
    // Use Future to wrap the async operation and return a Combine publisher
    func invoke(since: Int, perPage: Int) -> AnyPublisher<[GitUserModel], Error> {
        return Future { promise in
            Task {
                do {
                    let result = try await self.repository.getRemote(since: since, perPage: perPage)
                    promise(.success(result))  // Fulfill the promise with success
                } catch {
                    promise(.failure(error))  // Fulfill the promise with failure
                }
            }
        }
        .eraseToAnyPublisher() // Optionally, erase the type to return a more general publisher type
    }
}

