//
//  ContentView.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Home()
            }
            
            Tab("Favorites", systemImage: "heart") {
                Favorites()
            }
            
            Tab("Settings", systemImage: "gear") {
                Settings()
            }
        }
    }
}

#Preview {
    ContentView()
        .withRouter()
}
