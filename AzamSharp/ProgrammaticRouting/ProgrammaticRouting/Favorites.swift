//
//  Favorites.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct Favorites: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.birdRoutes) {
            VStack {
                List(1...10, id: \.self) { index in
                    NavigationLink("Favorites \(index)", destination: Text("Favorites Page number \(index)"))
                }
                .navigationTitle("Favorites")
                
                Button("Go to details") {
                    router.birdRoutes.append(.details(id: 1))
                }
                .navigationDestination(for: BirdRoute.self) { route in
                    switch route {
                    case .home:
                        Home()
                    case .details(id: 1):
                        BirdView(bird: Birds.example[1])
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
        .environment(Router())
}
