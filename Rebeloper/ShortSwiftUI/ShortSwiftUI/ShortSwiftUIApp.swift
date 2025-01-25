//
//  ShortSwiftUIApp.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import SwiftUI

@main
struct ShortSwiftUIApp: App {
    
    @State private var appService = AppService()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environment(appService)
        }
    }
}
