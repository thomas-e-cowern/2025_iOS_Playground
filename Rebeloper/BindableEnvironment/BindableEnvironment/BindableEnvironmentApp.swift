//
//  BindableEnvironmentApp.swift
//  BindableEnvironment
//
//  Created by Thomas Cowern on 4/19/25.
//

import SwiftUI

@main
struct BindableEnvironmentApp: App {
    
    @State private var appContoller = AppController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appContoller)
        }
    }
}
