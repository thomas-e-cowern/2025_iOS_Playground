//
//  ContentView.swift
//  TipKitDemo
//
//  Created by Thomas Cowern on 7/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension Color {
    static var random: Color {
        return Color(.sRGB, red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
