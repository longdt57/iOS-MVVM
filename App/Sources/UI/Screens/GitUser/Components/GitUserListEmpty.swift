//
//  GitUserListEmpty.swift
//  iOS MVVM
//
//  Created by Long Do on 31/12/2024.
//

import SwiftUI

struct GitUserListEmpty: View {
    let onRefresh: () -> Void
    
    var body: some View {
        VStack {
            Button(action: onRefresh) {
                Text("Retry") // Similar to stringResource(id = R.string.common_retry) in Compose
                    .font(.title2)
                    .foregroundColor(.blue) // You can customize this color
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Center the content
        .background(Color.gray.opacity(0.1)) // Optional background for better visibility
    }
}

struct GitUserListEmpty_Previews: PreviewProvider {
    static var previews: some View {
        GitUserListEmpty {
            // Add your action for refresh here
            print("Retry action triggered")
        }
        .previewLayout(.sizeThatFits)
    }
}

