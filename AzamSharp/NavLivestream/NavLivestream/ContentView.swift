//
//  ContentView.swift
//  NavLivestream
//
//  Created by Thomas Cowern on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    
    let names = ["Bob", "Alice", "Fred", "Mike", "Stephen"]
    
    var body: some View {
        VStack {
            List(names, id: \.self) { name in
                NavigationLink {
                    DetailView(name: name)
                } label: {
                    Text(name)
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
