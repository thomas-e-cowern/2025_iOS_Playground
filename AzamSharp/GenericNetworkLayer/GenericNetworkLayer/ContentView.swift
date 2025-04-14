//
//  ContentView.swift
//  GenericNetworkLayer
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("Products", systemImage: "bag") {
                ProductsView()
            }
            
            Tab("Product", systemImage: "cone") {
                Text("One Product")
            }
        }
    }
}

#Preview {
    ContentView()
}
