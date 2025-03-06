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
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        List {
            if !movies.isEmpty {
                Section(
                    header:
                        VStack {
                            Text("Watchlist")
                                .font(.largeTitle.weight(.black))
                                .foregroundStyle(.blue.gradient)
                                .padding()
                            
                            HStack {
                                Label("Title", systemImage: "movieclapper")
                                Spacer()
                                Label("Genre", systemImage: "tag")
                            }
                        }
                ) {
                    ForEach(movies) { movie in
                        HStack {
                            Text(movie.title)
                            Spacer()
                            Text(movie.genre.name)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                modelContext.delete(movie)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
        }
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Button {
                isSheetPresented.toggle()
            } label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            NewMovieView()
        }
    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
        .preferredColorScheme(.light)
}

#Preview("Movie List") {
    ContentView()
        .modelContainer(Movie.preview)
        .preferredColorScheme(.light)
}
