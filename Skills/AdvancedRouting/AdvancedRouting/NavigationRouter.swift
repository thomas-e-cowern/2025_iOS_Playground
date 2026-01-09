//
//  NavigationRouter.swift
//  AdvancedRouting
//
//  Created by Thomas Cowern on 1/9/26.
//

import SwiftUI

@Observable
final class NavigationRouter {
    var routes = [Route]()

    func push(to screen: Route) {
        routes.append(screen)
    }

    func reset() {
        routes = []
    }

    func navigateBack() {
        _ = routes.popLast()
    }
}
