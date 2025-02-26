//
//  Movie.swift
//  MovieList
//
//  Created by Thomas Cowern on 2/26/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

extension Movie {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Movie(title: "John Wick: Chapter 4", genre: Genre(rawValue: 1)!))
        container.mainContext.insert(Movie(title: "Mr Farty's Adventure", genre: Genre(rawValue: 2)!))
        container.mainContext.insert(Movie(title: "LA Confidential", genre: Genre(rawValue: 3)!))
        container.mainContext.insert(Movie(title: "The Endless Summer", genre: Genre(rawValue: 4)!))
        container.mainContext.insert(Movie(title: "Sophie's Choice", genre: Genre(rawValue: 5)!))
        container.mainContext.insert(Movie(title: "Willow", genre: Genre(rawValue: 6)!))
        container.mainContext.insert(Movie(title: "Mickey Mouse Clubhouse: The Movie", genre: Genre(rawValue: 7)!))
        container.mainContext.insert(Movie(title: "Moulin Rouge!", genre: Genre(rawValue: 8)!))
        
        return container
    }
}
