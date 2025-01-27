//
//  RebeloperCampApp.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

@main
struct RebeloperCampApp: App {
    
    @State private var appController = AppController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appController)
        }
    }
}
