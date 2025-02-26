//
//  ContentView.swift
//  MovieList
//
//  Created by Thomas Cowern on 2/26/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    
    var body: some View {
        List {
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
    }
}

#Preview("Empty List - Light Mode") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
        .preferredColorScheme(.light)
}

#Preview("Empty List - Dark Mode") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
        .preferredColorScheme(.dark)
}
