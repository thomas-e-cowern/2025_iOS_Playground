//
//  Home.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//

import SwiftUI

struct Home: View, Hashable {
    
    let backgroundColor: Color = Color.red.opacity(0.2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                VStack {
                    Text("Home")
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    Home()
}
