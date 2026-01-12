//
//  Favorites.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        NavigationStack {
            List(1...10, id: \.self) { index in
                NavigationLink("Favorites \(index)", destination: Text("Favorites Page number \(index)"))
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    Favorites()
}
