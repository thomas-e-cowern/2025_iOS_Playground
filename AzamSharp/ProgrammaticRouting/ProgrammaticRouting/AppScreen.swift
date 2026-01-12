//
//  AppScreen.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case home
    case favorites
    case settings
    
    var id: AppScreen { self }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("Home", systemImage: "house")
            case .favorites:
            Label("Favorites", systemImage: "star")
            case .settings:
            Label("Settings", systemImage: "gearshape")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            Text("Home")
        case .favorites:
            Text("Favorites")
        case .settings:
            Text("Settings")
        }
    }
}
