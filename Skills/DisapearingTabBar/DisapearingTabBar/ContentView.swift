//
//  ContentView.swift
//  DisapearingTabBar
//
//  Created by Thomas Cowern on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showTab: Bool = false
    
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
            .safeAreaPadding(.horizontal, 10)
            .scrollIndicators(.hidden)
            .overlay(alignment: .bottom) {
                if showTab {
                    CustomTabBarView()
                        .transition(.offset(y: 300))
                }
            }
            .onScrollGeometryChange(for: CGFloat.self) { geometry in
                geometry.contentOffset.y
            } action: { oldValue, newValue in
                if newValue > oldValue {
                    withAnimation {
                        showTab = false
                    }
                } else {
                    withAnimation {
                        showTab = true
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
