//
//  UserProfile.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


struct User: Codable {
    let id : Int?
    let lastName : String?
    let firstName : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    func toString() -> String {
        return "id: \(self.id), firstName: \(firstName), lastName: \(lastName)"
    }
}
