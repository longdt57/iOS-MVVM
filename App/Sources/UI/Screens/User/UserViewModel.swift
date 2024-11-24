//
//  UserViewModel.swift
// iOS MVVM
//
//  Created by Long Do on 12/12/2024.
//

import Foundation
import Resolver

class UserViewModel : BaseViewModel {
    
    @Injected var getUserUseCase: GetUserUseCase
    
    @Published var users: [User] = []
    
    func getUser() {
        Task {
            do {
                showLoading()
                try await users = getUserUseCase.invoke()
                hideLoading()
            } catch {
                Log.error(error)
                handleError(error: error)
            }
            hideLoading()
        }
    }
}
