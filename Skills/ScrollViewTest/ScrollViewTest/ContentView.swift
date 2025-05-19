//
//  ContentView.swift
//  ScrollViewTest
//
//  Created by Thomas Cowern on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    
    private var colors: [Color] = [.pink, .red, .blue, .gray, .green, .orange, .teal, .yellow, .black, .indigo]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1..<11) { circle in
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(colors[(Int(circle.description) ?? 0) - 1])
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
