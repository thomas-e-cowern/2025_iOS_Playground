//
//  ContentView.swift
//  OnAppearOnce
//
//  Created by Thomas Cowern on 5/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationLink {
                DestinationView()
            } label: {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Go to link...")
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
