//
//  FavoritesOne.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct FavoritesOne: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                Text("Favorites One")
            }
            
            Button {
                router.navigateTo(route: .favoritesTwo)
            } label: {
                Text("Favorites Two...")
            }

        }
    }
}

#Preview {
    FavoritesOne()
        .withRouter()
}
