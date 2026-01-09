//
//  ContentView.swift
//  AdvancedRouting
//
//  Created by Thomas Cowern on 1/9/26.
//

import SwiftUI

private struct NavigationRouterKey: EnvironmentKey {
    static let defaultValue: NavigationRouter = NavigationRouter()
}

extension EnvironmentValues {
    var navigationRouter: NavigationRouter {
        get { self[NavigationRouterKey.self] }
        set { self[NavigationRouterKey.self] = newValue }
    }
}

struct ContentView: View {
    
    @Environment(\.navigationRouter) var routerManager
    
    @State var favorites: [String] = ["Favorite 1", "Favorite 2", "Favorite 3"]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(favorites,id: \.self) { favorite in
                    NavigationLink(value: Route.favorites, label: {
                        Text(favorite)
                    })
                }
            }
            .navigationDestination(for: Route.self) { $0 }
        }
    }
}

#Preview {
    ContentView().environment(\.navigationRouter, NavigationRouter())
}
