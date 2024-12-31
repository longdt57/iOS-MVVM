//
//  GitUserRepository.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation

protocol GitUserRepository {
    func getRemote(since: Int, perPage: Int) async throws -> [GitUserModel]
}
