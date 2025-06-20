//
//  HomeView.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ActivityCard()
                
                ActivityCard()
            }
        }
        .padding(.horizontal, 2)
    }
}

#Preview {
    HomeView()
}
