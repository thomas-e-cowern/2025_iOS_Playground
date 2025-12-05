//
//  ContentView.swift
//  ContextMenuPlayground
//
//  Created by Thomas Cowern on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.title)
            Text("Hello, world!")
                .font(.headline)
            Text("Using the context menu")
                .font(.subheadline)
        }
        .padding()
        .background(Color.blue)
        .foregroundStyle(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .contextMenu(menuItems: {
            Text("Menu Item 1")
            Text("Menu Item 2")
            Text("Menu Item 3")
        })
//        .contextMenu {
//            Text("This should be the context menu")
//        }
    }
}

#Preview {
    ContentView()
}
