//
//  Router.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case home
    case settings
    case favorites
    case homeOne
    case homeTwo
}

@Observable
class Router {
    var path = NavigationPath()
    
    func navigateTo(route: Route) {
        path.append(route)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct RouterViewModifier: ViewModifier {

    @State private var router = Router()
    
    func navigate(route: Route) -> some View {
        Group {
            switch route {
            case .home:
                Home()
            case .settings:
                Settings()
            case .favorites:
                Favorites()
            case .homeOne:
                HomeOne()
            case .homeTwo:
                HomeTwo()
            }
        }
        .environment(router)
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    navigate(route: route)
                }
        }
    }
}

extension View {
    func withRouter() -> some View {
        modifier(RouterViewModifier())
    }
}
