//
//  TokenInfo.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


struct TokenInfo: Codable {
    let accessToken, refreshToken: String?
    let expiredTime: Int64?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
        case expiredTime = "expiredTime"
    }
    
    init(accessToken: String?, refreshToken: String?, expiredTime: Int64) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiredTime = expiredTime
    }
    
    func getAccessToken() -> String {
        return accessToken.orEmpty()
    }
}
