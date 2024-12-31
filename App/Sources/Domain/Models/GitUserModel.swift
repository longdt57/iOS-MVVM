//
//  GitUserModel.swift
//  iOS MVVM
//
//  Created by Long Do on 30/12/2024.
//

import Foundation

struct GitUserModel : Identifiable {
    let id: Int64
    let login: String
    let avatarUrl: String?
    let htmlUrl: String?
}

