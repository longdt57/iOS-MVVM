//
//  KeychainKey.swift
//  PureClean AI
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//


protocol KeychainKey {}

extension KeychainKey {

    static var signInInfo: Keychain.Key<TokenInfo> {
        Keychain.Key(key: "signInInfo")
    }
    
    static var userProfile: Keychain.Key<User> {
        Keychain.Key(key: "userProfile")
    }
}
