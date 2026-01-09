//
//  AdvancedRoutingApp.swift
//  AdvancedRouting
//
//  Created by Thomas Cowern on 1/9/26.
//

import SwiftUI

@main
struct AdvancedRoutingApp: App {
    
    @State private var routerManager = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environment(routerManager)
        }
    }
}

