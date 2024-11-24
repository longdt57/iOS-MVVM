//
//  Color+UIColor.swift
//  app
//
//  Created by Long Do on 02/10/2022.
//

import SwiftUI
import UIKit

extension Color {

    public var uiColor: UIColor {
        UIColor(self)
    }
}

extension UIColor {
    public var color: Color {
        Color(self)
    }
}
