//
//  ContentView.swift
//  SlideMenu
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                   HomeView()
                }
            }
            
            Tab("Person", systemImage: "person") {
                NavigationStack {
                    Profile()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
