//
//  UserProfile.swift
// iOS MVVM
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


struct User: Codable, Identifiable {
    let id : Int?
    let lastName : String?
    let firstName : String?
    
    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName
    }
    
    func toString() -> String {
        return "id: \(self.id), firstName: \(firstName), lastName: \(lastName)"
    }
}
