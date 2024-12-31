//
//  GitUserListScreenView.swift
//  iOS MVVM
//
//  Created by Long Do on 31/12/2024.
//

import SwiftUI
import Resolver

struct GitUserListScreen: View {
    
    @StateObject var viewModel: GitUserListViewModel = Resolver.resolve()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.uiModel.users) { item in
                    Text(item.login)
                }
            }
        }
        .showLoading(loadingState:  $viewModel.loading)
        .showError(error: $viewModel.error, primaryAction: {
            viewModel.onErrorPrimaryAction()
        }, secondaryAction: {
            viewModel.onErrorSecondaryAction()
        })
        .onAppear {
            viewModel.handleAction(action: .loadIfEmpty)
        }
        .paddingRootView()
    }
}

#Preview {
    GitUserListScreen()
}

