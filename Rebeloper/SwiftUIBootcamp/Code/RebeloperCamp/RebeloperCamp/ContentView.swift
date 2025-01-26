//
//  ContentView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .background(.yellow)
            Text("Hello, world!")
                .background(.yellow)
            Color.red
            Color.blue
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
