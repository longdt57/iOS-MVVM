//
//  View+Navigation.swift
//  iOS MVVM
//
//  Created by Long Do on 17/12/2024.
//

import SwiftUI

extension View {
    
    @inlinable public func setNavigationTitleForegroundColor(_ color: Color) {
        let uiColor: UIColor = color.uiColor
        // Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor]
        
        // Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor]
    }
    
    @inlinable public func navigationBarItemEmpty() -> some View {
        self.navigationBarItems(leading: Button(action: {}) { EmptyView() })
    }
    
    public func navigationBarItemBack(action: @escaping () -> Void) -> some View {
        self.navigationBarItems(leading: Button(action: action) {
            Image(systemName: "chevron.left")
        })
    }
    
    func navigationAsRoot() -> some View {
        self
            .navigationViewStyle(.stack)
            .navigationBarBackButtonHidden(true)
    }
    
    func toolbarTitle(_ text: String) -> some View {
        self.toolbar {
            ToolbarItem(placement: .principal) {
                Text(text)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, maxHeight: 48, alignment: .center)
            }
        }
    }
    
    func openSettings() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsUrl)
        }
    }
}

