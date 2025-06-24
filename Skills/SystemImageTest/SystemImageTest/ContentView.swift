//
//  ContentView.swift
//  SystemImageTest
//
//  Created by Thomas Cowern on 6/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols: [String] = ["star.fill", "swirl.circle.righthalf.filled.inverse", "circle.dotted.circle.fill", "person.fill", "sun.min.fill"]
    
    var body: some View {
        VStack {
            ForEach(symbols, id: \.self) { symbol in
                Image(systemName: symbol)
                    .padding(10)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
