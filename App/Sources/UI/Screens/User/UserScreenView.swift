//
//  ContentView.swift
// iOS MVVM
//
//  Created by Long Do on 22/11/2024.
//

import SwiftUI
import Resolver

struct UserScreenView: View {
    
    @StateObject var viewModel: UserViewModel = Resolver.resolve()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.users) { item in
                    Text(item.firstName.orEmpty())
                }
            }
        }
        .showLoading(loadingState:  $viewModel.loadingState)
        .showError(error: $viewModel.error, primaryAction: {
            viewModel.onErrorPrimaryButtonClick()
        }, secondaryAction: {
            viewModel.onErrorSecondaryButtonClick()
        })
        .onAppear {
            viewModel.getUser()
        }
    }
}

#Preview {
    UserScreenView()
}
