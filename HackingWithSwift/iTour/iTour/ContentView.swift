//
//  ContentView.swift
//  iTour
//
//  Created by Thomas Cowern on 10/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [Destination]()
    
    @Query var destinations: [Destination]
    
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    ForEach(destinations) { destination in
                        NavigationLink(value: destination) {
                            VStack(alignment: .leading) {
                                Text(destination.name)
                                    .font(.headline)
                                
                                Text(destination.date.formatted(date: .long, time: .shortened))
                            }
                        }
                    }
                    .onDelete(perform: deleteDestinations)
                }
                .navigationTitle("iTour")
                .toolbar {
                    Button("Add Samples", action: addSamples)
                    Button("Add Destination", systemImage: "plus", action: addDestination)
                }
                .navigationDestination(for: Destination.self) { destination in
                    EditDestinationView(destination: destination)
                }
            }
        }
        .padding()
    }
    
    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
        .modelContainer(ModelContainer.preview)
}
