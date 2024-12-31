//
//  View+Shadow.swift
//  iOS MVVM
//
//  Created by Long Do on 17/12/2024.
//

import SwiftUI

extension View {
    public func addShadow() -> some View {
        return self.shadow(color: R.color.grayBDBDBDColor()!.color, radius: 4, x: 2, y: 2)
    }
}
