//
//  ContentView.swift
//  NetworkMonitoring
//
//  Created by Thomas Cowern on 4/30/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.network) var network
    
    var body: some View {
        VStack {
            if network.isConnected {
                Image(systemName: "hand.thumbsup")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Connected")
            } else {
                Image(systemName: "hand.thumbsdown")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Not Connected")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
