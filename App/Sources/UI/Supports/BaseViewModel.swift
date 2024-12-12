//
//  BaseViewModel.swift
//  app
//
//  Created by Long Do on 07/10/2022.
//

import Combine
import Foundation

open class BaseViewModel : ObservableObject {
    
    @Published var loadingState: LoadingState = .none
    @Published var error: ErrorState = .none
    
    let cancellables = Set<AnyCancellable>()
    
    func showLoading() {
        loadingState = .loading(cancellable: true, message: "")
    }
    
    func hideLoading() {
        loadingState = .none
    }
    
    func handleError(error: NetworkAPIError) {
        switch error {
            case .generic:
                self.error = .common()
                break;
            case .dataNotFound:
                self.error = .network()
                break;
        }
        
    }
    
    func hideError() {
        error = .none
    }
    
    deinit {
        cancellables.forEach {
            $0.cancel()
        }
    }
}
