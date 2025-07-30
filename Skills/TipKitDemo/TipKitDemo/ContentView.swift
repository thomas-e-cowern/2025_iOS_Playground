//
//  ContentView.swift
//  TipKitDemo
//
//  Created by Thomas Cowern on 7/30/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var colors = MockData.colors
    let addColorTip = AddColorTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color.gradient)
                        .frame(height: 100)
                        .contextMenu {
                            Button("Favorite") {
                                // More to come...
                            }
                        }
                }
            }
            .padding()
            .navigationTitle("TipKit Demo")
            .toolbar {
                Button {
                    colors.insert(.random, at: 0)
                } label: {
                    Image(systemName: "plus")
                }
                .buttonStyle(.bordered)
                .popoverTip(addColorTip)
                
            }
        }
    }
}

#Preview {
    ContentView()
        .task {
            try? Tips.resetDatastore()
            try? Tips.configure(
                [
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ]
            )
        }
}

extension Color {
    static var random: Color {
        return Color(.sRGB, red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}

struct MockData {
    static let colors = [
        Color.random,
        Color.random,
        Color.random,
        Color.random
    ]
}
