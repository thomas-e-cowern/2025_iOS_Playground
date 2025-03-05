//
//  ContentView.swift
//  SlideMenu
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var slideInMenuService = SlideInMenuService()
    
    var body: some View {
        Group {
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
        .environmentObject(slideInMenuService)
        .slideInView(isActive: $slideInMenuService.isPresented) {
            MenuView()
        }
    }
}

#Preview {
    ContentView()
}
