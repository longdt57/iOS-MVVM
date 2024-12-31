//
//  GitUserAppBar.swift
//  iOS MVVM
//
//  Created by Long Do on 31/12/2024.
//

import SwiftUI

struct GitUserListAppBar: View {
    var body: some View {
        Text(R.string.localizable.git_user_list_screen_title())
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 48, alignment: .center)
    }
}

struct GitUserListAppBar_Previews: PreviewProvider {
    static var previews: some View {
        GitUserListAppBar()
    }
}

