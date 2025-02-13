//
//  ContentView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var vegatables: [Vegetable] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(vegatables) { vegetable in
                    Text(vegetable.name)
                }
            }
        }
        .task {
            do {
                let client = HTTPService()
                vegatables = try await client.fetchVegatables()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
