//
//  MovieListApp.swift
//  MovieList
//
//  Created by Thomas Cowern on 2/26/25.
//

import SwiftUI
import SwiftData

@main
struct MovieListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}
