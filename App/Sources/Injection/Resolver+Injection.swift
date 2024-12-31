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
        
        registerViewModel()
        registerUseCases()
        registerNetwork()
        registerLocalSource()
        registerRepositories()
        registerAnalytics()
        registerDispatchQueueProvider()
        registerMappers()
    }
    
    private static func registerNetwork() {
        register(AuthenticatedInterceptor.self) { AuthenticatedInterceptor() }
        register(NetworkAPIProtocol.self) {
            NetworkAPI(decoder: resolve(), authenticatedInterceptor: resolve())
        }
    }
    
    private static func registerLocalSource() {
        register(GitUserLocalSource.self) { GitUserLocalSource() }
        register(GitUserDetailLocalSource.self) { GitUserDetailLocalSource() }
    }
    
    private static func registerRepositories() {
        register(UserRepository.self) { UserRepositoryImpl() }
        register(GitUserRepository.self) { GitUserRepositoryImpl() }
        register(GitUserDetailRepository.self) { GitUserDetailRepositoryImpl() }
    }
    
    private static func registerUseCases() {
        register(GetUserUseCase.self) { GetUserUseCase() }
        register(GetGitUserUseCase.self) { GetGitUserUseCase() }
        register(GetGitUserDetailRemoteUseCase.self) { GetGitUserDetailRemoteUseCase() }
        register(GetGitUserDetailLocalUseCase.self) { GetGitUserDetailLocalUseCase() }
    }
    
    private static func registerViewModel() {
        register(UserViewModel.self) { UserViewModel() }
        register(GitUserListViewModel.self) { GitUserListViewModel() }
        register(GitUserDetailViewModel.self) { GitUserDetailViewModel() }
    }
    
    private static func registerAnalytics() {
        register(AppAnalytics.self) { AppAnalytics.Builder().build() }
    }
    
    private static func registerDispatchQueueProvider() {
        register(DispatchQueueProvider.self) { DefaultDispatchQueueProvider() }
    }
    
    private static func registerMappers() {
        register(GitUserDetailUiMapper.self) { GitUserDetailUiMapperImpl() }
    }
}
