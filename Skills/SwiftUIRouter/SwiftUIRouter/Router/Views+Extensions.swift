//
//  Views+Extensions.swift
//  SwiftUIRouter
//
//  Created by Thomas Cowern on 4/29/25.
//
import SwiftUI

// Step three, create an View+EXtensions file with an extension for the router
struct RouterViewModifier: ViewModifier {
    @State private var router = Router()
    
    private func routerView(for route: Route) -> some View {
        Group {
            switch route {
            case .firstView:
                FirstView()
            case .secondView:
                SecondView()
            case .thirdView:
                ThirdView()
            }
        }
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    routerView(for: route)
                }
        }
        
    }
}

