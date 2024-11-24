import SwiftUI

extension View {
    
    func removeDivider() -> some View {
        if #available(iOS 15.0, *) {
            return self.listRowSeparator(.hidden)
        }
        return self
    }
}
