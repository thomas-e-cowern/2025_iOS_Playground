//
//  TabViewPlaygroundApp.swift
//  TabViewPlayground
//
//  Created by Thomas Cowern on 4/24/25.
//

import SwiftUI

@main
struct TabViewPlaygroundApp: App {
    
    @State private var appController = AppController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appController)
        }
    }
}
