//
//  Enums.swift
//  AdvancedRouting
//
//  Created by Thomas Cowern on 1/9/26.
//

import SwiftUI

enum Destination: Hashable {
    case tab(TabDestination)
    case push(PushDestination)
    case sheet(SheetDestination)
}

enum TabDestination: String, Hashable {
    case home
    case favorites
    case settings
}

enum PushDestination: Hashable {
    case favoriteList
    case settingsDetail(section: String)
}

enum SheetDestination: Identifiable, Hashable {
    case favoriteList
    case settingsDetail(section: String)

    var id: String {
        switch self {
        case .favoriteList:
            return "Favorites"
        case .settingsDetail(section: "Section"):
            return "Section"
        default:
            return "Home"
        }
    }
}

@ViewBuilder
func view(for destination: PushDestination) -> some View {
    switch destination {
    case .favoriteList:
        Favorites()
    case .settingsDetail(section: let section):
        Settings()
    }
}

@ViewBuilder
func view(for destination: SheetDestination) -> some View {
    switch destination {
    case .favoriteList:
        Favorites()
    case .settingsDetail(section: let section):
        Settings()
    }
}
