//
//  Search.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//

import SwiftUI

struct Search: View {
    let backgroundColor: Color = Color.gray.opacity(0.4)
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                VStack {
                    Text("Search")
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    Search()
}
