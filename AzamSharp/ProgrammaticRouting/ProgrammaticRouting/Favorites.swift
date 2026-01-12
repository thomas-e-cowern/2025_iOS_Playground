//
//  Favorites.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct Favorites: View {
    
    @State private var routes: [BirdRoute] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            VStack {
                List(1...10, id: \.self) { index in
                    NavigationLink("Favorites \(index)", destination: Text("Favorites Page number \(index)"))
                }
                .navigationTitle("Favorites")
                
                Button("Go to details") {
                    routes.append(.details(id: 2))
                }
                .navigationDestination(for: BirdRoute.self) { route in
                    switch route {
                    case .home:
                        Home()
                    case .details(id: 2):
                        BirdView(bird: Birds.example[2])
                    default:
                        Home()
                    }
                }
            }
        }
    }
}

#Preview {
    Favorites()
}
