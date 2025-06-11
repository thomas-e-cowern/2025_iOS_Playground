//  FavoritesTwo.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct FavoritesTwo: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                Text("Favorites Two")
            }
            
            Button {
                router.popToRoot()
            } label: {
                Text("Back to favorites...")
            }

        }
    }
}

#Preview {
    FavoritesTwo()
        .withRouter()
}
