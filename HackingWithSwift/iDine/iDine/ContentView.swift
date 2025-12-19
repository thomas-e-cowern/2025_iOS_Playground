//
//  ContentView.swift
//  iDine
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack  {
            List(menu) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) { item in
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
