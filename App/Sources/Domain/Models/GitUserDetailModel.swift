//
//  GitUserDetailModel.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation

struct GitUserDetailModel : Identifiable {
    let id: Int64
    let login: String
    let name: String?
    let avatarUrl: String?
    let blog: String?
    let location: String?
    let followers: Int
    let following: Int
}
