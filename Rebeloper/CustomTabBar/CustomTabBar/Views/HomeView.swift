//
//  HomeView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 7/8/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            Color.blue.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            HStack {
                Image(systemName: "house")
                    .font(.title)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.title)
            }
        }
    }
}

#Preview {
    HomeView()
}
