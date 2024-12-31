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
            appBar()
            userListView()
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
    
    private func userListView() -> some View {
        GitUserList(
            users: viewModel.uiModel.users,
            onClick: { _ in },
            onLoadMore: { viewModel.handleAction(action: .loadMore)}
        )
    }
    
    private func appBar() -> some View {
        return GitUserListAppBar()
    }
    
    
}

#Preview {
    GitUserListScreen()
}


