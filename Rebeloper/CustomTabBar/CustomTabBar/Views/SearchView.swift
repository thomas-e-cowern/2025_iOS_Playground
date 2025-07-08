//
//  SearchView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 7/8/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            
            Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                Text("Search")
                    .font(.title)
            }
        }
    }
}

#Preview {
    SearchView()
}
