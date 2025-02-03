//
//  Navigation.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

@Observable
class Navigation {
    var stack = NavigationPath()
    var selectedTab: TabNavigation = .home
    
    init(stack: NavigationPath = NavigationPath()) {
        self.stack = stack
    }
    
}

enum TabNavigation: Hashable {
    case home
    case profile
    case settings
}

