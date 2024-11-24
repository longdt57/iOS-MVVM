//
//  BaseViewModel.swift
//  app
//
//  Created by Long Do.
//

import Combine
import Foundation

open class BaseViewModel : ObservableObject {
    
    @Published var loadingState: LoadingState = .none
    @Published var error: ErrorState = .none
    
    let cancellables = Set<AnyCancellable>()
    
    func showLoading() {
        loadingState = .loading(cancellable: true, message: R.string.localizable.loading_3_dot())
    }
    
    func hideLoading() {
        loadingState = .none
    }

    func handleError(error: Error) {
        switch error {
            case NetworkAPIError.generic:
                self.error = .common()
                break;
            case NetworkAPIError.dataNotFound:
                self.error = .network()
                break;
            default:
                self.error = .common()
        }
    }
    
    func hideError() {
        error = .none
    }
    
    func onErrorPrimaryButtonClick() {
        error = .none
    }
    
    func onErrorSecondaryButtonClick() {
        error = .none
    }
    
    deinit {
        cancellables.forEach {
            $0.cancel()
        }
    }
}
