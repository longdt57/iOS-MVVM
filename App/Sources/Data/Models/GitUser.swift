//
//  GitUser.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation

struct GitUser: Codable {
    let id: Int64
    let login: String
    let avatarUrl: String?
    let htmlUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}

extension GitUser {
    func mapToDomain() -> GitUserModel {
        return GitUserModel(id: id, login: login, avatarUrl: avatarUrl, htmlUrl: htmlUrl)
    }
}
