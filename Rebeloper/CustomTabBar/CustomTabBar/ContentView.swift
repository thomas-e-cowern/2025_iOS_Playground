//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 7/8/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var selectedTab: String = "Home"
    @Namespace private var animation
    
    var body: some View {
        VStack {
            Group {
                switch selectedTab {
                case "Home":
                    HomeView()
                case "Account":
                    AccountView()
                case  "Search":
                    SearchView()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab, animation: animation)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
