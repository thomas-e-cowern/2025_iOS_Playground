//
//  MainView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/29/25.
//

import SwiftUI

struct MainView: View {
    
    @ScaledMetric var spacingSize: CGFloat = 10
    
    @State private var colors: [Color] = [.red, .blue, .green, .yellow, .orange]
    
    var body: some View {
        LazyVGrid(columns: [GridItem()/*, GridItem()*/], alignment: .leading, spacing: 10, pinnedViews: [.sectionFooters, .sectionHeaders]) {
            ForEach(colors, id: \.self) { color in
                color
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
