//
//  SwiftUIRoutingApp.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

@main
struct SwiftUIRoutingApp: App {
    
    @StateObject private var appRouts: Router<AppRoutes> = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appRouts)
        }
    }
}
