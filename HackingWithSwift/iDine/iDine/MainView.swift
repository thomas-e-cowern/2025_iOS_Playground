//
//  MainView.swift
//  iDine
//
//  Created by Thomas Cowern on 12/20/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Menu", systemImage: "list.dash") {
                ContentView()
            }
            
            Tab("Cart", systemImage: "square.and.pencil") {
                OrderView()
            }
        }
    }
}

#Preview {
    MainView()
        .environment(Order())
}
