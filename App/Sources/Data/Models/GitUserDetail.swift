//
//  GitUserDetail.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation

struct GitUserDetail: Codable {
    let id: Int64
    let login: String
    let name: String?
    let avatarUrl: String?
    let blog: String?
    let location: String?
    let followers: Int?
    let following: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarUrl = "avatar_url"
        case blog
        case location
        case followers
        case following
    }
}

extension GitUserDetail {
    func mapToDomain() -> GitUserDetailModel {
        return GitUserDetailModel(
            id: self.id,
            login: self.login,
            name: self.name,
            avatarUrl: self.avatarUrl,
            blog: self.blog,
            location: self.location,
            followers: self.followers ?? 0,  // Default to 0 if nil
            following: self.following ?? 0   // Default to 0 if nil
        )
    }
}
