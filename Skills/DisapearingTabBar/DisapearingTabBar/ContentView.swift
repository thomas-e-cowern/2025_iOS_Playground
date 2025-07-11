//
//  ContentView.swift
//  DisapearingTabBar
//
//  Created by Thomas Cowern on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(0..<15) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.gray.tertiary)
                            .frame(height: 200)
                    }
                }
            }
        }
        .safeAreaPadding(.horizontal, 10)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
