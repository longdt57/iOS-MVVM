//
//  Resolver+Injection.swift
// iOS MVVM
//
//  Created by Do, LongThanh | MDSD on 2024/11/25.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .graph
        
        register(KeychainProtocol.self) { Keychain.default }.scope(.application)
        register(JSONDecoder.self) { JSONDecoder.default }.scope(.application)
        
        registerNetwork()
        registerRepositories()
    }
    
    private static func registerNetwork() {
        register(AuthenticatedInterceptor.self) { AuthenticatedInterceptor() }
        register(NetworkAPIProtocol.self) {
            NetworkAPI(decoder: resolve(), authenticatedInterceptor: resolve())
        }
    }
    
    private static func registerRepositories() {
        register(UserRepository.self) {
            UserRepositoryImpl()
        }
    }
    
    private static func registerUseCases() {
        register(GetUserUseCase.self) { GetUserUseCase() }
    }
}
