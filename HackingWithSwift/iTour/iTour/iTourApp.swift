//
//  iTourApp.swift
//  iTour
//
//  Created by Thomas Cowern on 10/15/25.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self, isAutosaveEnabled: true)
    }
}
