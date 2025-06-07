//
//  CustomTabBarApp.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//

import SwiftUI

@main
struct CustomTabBarApp: App {
    
    @State private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                ContentView()
            }
            .environment(router)
        }
    }
}
