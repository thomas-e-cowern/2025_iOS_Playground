//
//  Router.swift
//  SwiftUIRouter
//
//  Created by Thomas Cowern on 4/29/25.
//

import Foundation
import SwiftUI
import Observation

// Step one create an enum for each view
enum Route: Hashable{
    case firstView(name: String)
    case secondView
    case thirdView
}

// Step two create an @Observable router with a path, popToRoute function and function for each view using the enums
@Observable
class Router {
    var path = NavigationPath()
    
    func navigateToFirstVIew() {
        path.append(Route.firstView(name: ""))
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
