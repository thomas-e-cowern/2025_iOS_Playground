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
    let setFavoriteTip = SetFavoriteTip()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TipView(setFavoriteTip)
                    .tipImageStyle(.red)
                    .tipBackground(.teal.opacity(0.5))
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color.gradient)
                        .frame(height: 100)
                        .contextMenu {
                            Button("Favorite") {
                                // More to come...
                                Task {
                                    await SetFavoriteTip.setFavoriteEvent.donate()
                                }
                            }
                        }
                }
            }
            .onAppear {
                Task {
                    await SetFavoriteTip.colorsViewVisitedEvent.donate()
                }
            }
            .padding()
            .navigationTitle("TipKit Demo")
            .toolbar {
                Button {
                    colors.insert(.random, at: 0)
                    addColorTip.invalidate(reason: .actionPerformed)
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
