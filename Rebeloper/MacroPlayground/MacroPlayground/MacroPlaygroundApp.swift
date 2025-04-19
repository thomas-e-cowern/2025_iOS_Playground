//
//  MacroPlaygroundApp.swift
//  MacroPlayground
//
//  Created by Thomas Cowern on 4/19/25.
//

import SwiftUI

@main
struct MacroPlaygroundApp: App {
    
    @State private var appController = AppController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appController)
        }
    }
}
