//
//  Favorites.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//
import SwiftUI

struct Favorites: View {
    let backgroundColor: Color = Color.blue.opacity(0.2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                VStack {
                    Text("Favorites")
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    Favorites()
}
