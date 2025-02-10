//
//  ContentView.swift
//  Paws
//
//  Created by Thomas Cowern on 2/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query private var pets: [Pet]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                EmptyView()
            }
            .overlay {
                if pets.isEmpty {
                    CustomContentUnavailableView(icon: "dog.circle", title: "No Pets", description: "Add a new pet to get started!")
                }
            }
        }
    }
}

#Preview("No Data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
