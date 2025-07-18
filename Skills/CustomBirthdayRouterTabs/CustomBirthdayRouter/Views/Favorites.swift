//
//  Favorites.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct Favorites: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                Text("Favorites")
            }
            
            Button {
                router.navigateTo(route: .favoritesOne)
            } label: {
                Text("Off to Favorites one")
            }

        }
    }
}

#Preview {
    Favorites()
        .withRouter()
}
