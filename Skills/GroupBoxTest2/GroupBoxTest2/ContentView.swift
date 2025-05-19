//
//  ContentView.swift
//  GroupBoxTest2
//
//  Created by Thomas Cowern on 5/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(.pink.gradient.opacity(0.8))
                .ignoresSafeArea()
            
            VStack {
                GroupBox("My Content") {
                    Image(systemName: "globe")
                        .foregroundStyle(Color.red)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!  This is an examle of a Group Box and its contents. With a little image.  Of Course")
                }
                .frame(width: 300)
                
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                }
                .groupBoxStyle(.music)
                
                
            }
            .padding()
        }
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
