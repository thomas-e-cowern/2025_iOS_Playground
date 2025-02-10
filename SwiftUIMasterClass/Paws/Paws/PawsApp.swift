//
//  PawsApp.swift
//  Paws
//
//  Created by Thomas Cowern on 2/10/25.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
