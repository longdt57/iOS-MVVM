//
//  View+ToastUI.swift
//  app
//
//  Created by Long Do
//

import SwiftUI
import AlertToast

extension View {
    
    func showLoading(loadingState: Binding<LoadingState>) -> some View {
        let isPresenting = Binding(
            get: { if case .loading = loadingState.wrappedValue { return true } else { return false }},
            set: { isLoading in
                loadingState.wrappedValue = isLoading ? .loading(cancellable: true, message: "") : .none
            }
        )
        
        let message = loadingState.wrappedValue.message
        
        return self.toast(isPresenting: isPresenting) {
            AlertToast(type: .loading, subTitle: message)
        }
    }
    
    func showError(error: Binding<ErrorState>, primaryAction: (() -> Void)? = {}, secondaryAction: (() -> Void)? = {}) -> some View {
        let isPresenting = Binding(
            get: { if case .message = error.wrappedValue { return true } else { return false }},
            set: { isErrorPresent in
                if !isErrorPresent {
                    error.wrappedValue = .none
                }
            }
        )
        
        
        return self.alert(isPresented: isPresenting) {
            switch error.wrappedValue {
                case .none:
                    return Alert(title: Text(""), message: nil, dismissButton: .default(Text("OK")))
                    
                case .message(title: let title, message: let message, primaryButton: let primaryButton, secondaryButton: let secondaryButton):
                    if let secondText = secondaryButton {
                        return Alert(
                            title: Text(title),
                            message: Text(message),
                            primaryButton: .default(Text(primaryButton), action: primaryAction),
                            secondaryButton: .cancel(Text(secondText), action: secondaryAction)
                        )
                    } else {
                        return Alert(
                            title: Text(title),
                            message: Text(message),
                            dismissButton: .default(Text(primaryButton), action: primaryAction)
                        )
                    }
            }
        }
    }
}
