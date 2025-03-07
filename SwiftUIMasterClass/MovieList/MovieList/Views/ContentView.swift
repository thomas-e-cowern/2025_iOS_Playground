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
    @State private var randomMovie: String = ""
    
    // MARK: - Methods and functions
    private func randomMovieGenerator() {
        randomMovie = movies.randomElement()!.title
    }
    
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
                                .font(.title.weight(.light))
                                .padding(.vertical, 2)
                            Spacer()
                            Text(movie.genre.name)
                                .font(.footnote.weight(.medium))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
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
            HStack {
                if movies.count >= 2 {
                    Button {
                        randomMovieGenerator()
                    } label: {
                        ButtonImageView(symbolName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                    }
                }
                
                Spacer()
                
                Button {
                    isSheetPresented.toggle()
                } label: {
                    ButtonImageView(symbolName: "plus.circle.fill")
                }
            } //: End of HStack
            .padding(.horizontal)
        } //: End of safeAreaInset
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
