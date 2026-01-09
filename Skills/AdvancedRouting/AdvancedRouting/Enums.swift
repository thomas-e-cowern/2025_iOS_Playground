//
//  Enums.swift
//  AdvancedRouting
//
//  Created by Thomas Cowern on 1/9/26.
//

import SwiftUI

enum Route: Hashable {
    case home
    case favorites
    case settings
}

extension Route: View {
    var body: some View {
        switch self {
        case .home:
            Home()
        case .favorites:
            Favorites()
        case .settings:
            Settings()
        }
    }
}
