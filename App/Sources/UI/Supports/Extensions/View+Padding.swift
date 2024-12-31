//
//  View+Padding.swift
//  iOS MVVM
//
//  Created by Long Do on 17/12/2024.
//

import SwiftUI

extension View {
    
    @inlinable public func paddingRootView() -> some View {
        return self.paddingVertical(0.5)
    }
    
    @inlinable public func paddingVertical(_ length: CGFloat = 32) -> some View {
        return self.padding([.top, .bottom], length)
    }
    
    @inlinable public func paddingHorizontal(_ length: CGFloat = 16) -> some View {
        return self.padding([.leading, .trailing], length)
    }
    
    @inlinable public func paddingTop(_ length: CGFloat? = nil) -> some View {
        self.padding(.top, length)
    }
    
}

