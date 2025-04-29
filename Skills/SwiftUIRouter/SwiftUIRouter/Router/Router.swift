//
//  Router.swift
//  SwiftUIRouter
//
//  Created by Thomas Cowern on 4/29/25.
//

import Foundation
import SwiftUI
import Observation

enum Route: Hashable {
    case firstView
    case secondView
    case thirdView
}

@Observable
class Router {
    var path = NavigationPath()
    
    func navigateToFirstVIew() {
        path.append(Route.firstView)
    }
    
    func navigateToSecindVIew() {
        path.append(Route.secondView)
    }
    
    func navigateToThirdVIew() {
        path.append(Route.thirdView)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
