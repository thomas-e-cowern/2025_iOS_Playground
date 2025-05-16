//
//  ContentView.swift
//  GroupBoxTest
//
//  Created by Thomas Cowern on 5/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GroupBox {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
