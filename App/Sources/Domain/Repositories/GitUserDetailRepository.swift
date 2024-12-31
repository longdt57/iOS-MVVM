//
//  GitUserDetailRepository.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation

protocol GitUserDetailRepository {
    func getRemote(userName: String) async throws -> GitUserDetailModel
}
