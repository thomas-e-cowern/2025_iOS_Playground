//
//  ContentView.swift
//  ScrollViewTest
//
//  Created by Thomas Cowern on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    private var colors: [Color] = [.pink, .red, .blue, .gray, .green, .orange, .teal, .yellow, .black, .indigo]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1..<11) { circle in
                        Circle()
                            .containerRelativeFrame(.horizontal,
                                                    count: verticalSizeClass == .regular ? 2 : 4, spacing: 16)
                            .foregroundStyle(colors[(Int(circle.description) ?? 0) - 1])
                    }
                }
            }
        }
        .contentMargins(16, for: .scrollContent)
    }
}

#Preview {
    ContentView()
}
