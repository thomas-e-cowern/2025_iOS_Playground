//
//  NewMovieView.swift
//  MovieList
//
//  Created by Thomas Cowern on 2/26/25.
//

import SwiftUI

struct NewMovieView: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .action
    
    var body: some View {
        Form {
            List {
                // MARK: - Header
                Text("What to watch")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                
                // MARK: - Title
                TextField("Movie Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))
                
                // MARK: - Genre
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }
                
                // MARK: - Save Button
                Button {
                    if title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        print("Input is Invalid")
                    } else {
                        addNewMovie()
                        dismiss()
                    }
                } label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
                .disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
                // MARK: - Cancel Button
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .frame(maxWidth: .infinity)
                }
                
            } //: End of list
        } //: End of form
    }
    
    // MARK: - Methods and functions
    func addNewMovie() {
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        title = ""
        selectedGenre = .action
    }
}

#Preview {
    NewMovieView()
}
