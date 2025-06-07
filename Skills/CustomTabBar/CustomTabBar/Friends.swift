//
//  Friends.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//

import SwiftUI

struct Friends: View {
    let backgroundColor: Color = Color.orange.opacity(0.2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                VStack {
                    Text("Friends")
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    Friends()
}
