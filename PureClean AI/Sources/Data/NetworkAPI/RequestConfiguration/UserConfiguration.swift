//
//  UserRequestConfiguration.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//

import Alamofire

enum UserConfiguration {
    case getUsers
}

extension UserConfiguration: RequestConfiguration {
    var baseURL: String {
        "https://dummyjson.com/"
    }
    
    var endpoint: String {
        switch self {
            case .getUsers: return "users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getUsers: return .get
        }
    }
    
}

