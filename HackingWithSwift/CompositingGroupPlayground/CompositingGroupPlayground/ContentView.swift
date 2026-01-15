//
//  ContentView.swift
//  CompositingGroupPlayground
//
//  Created by Thomas Cowern on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipped()
                .shadow(color: .black, radius: 5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
