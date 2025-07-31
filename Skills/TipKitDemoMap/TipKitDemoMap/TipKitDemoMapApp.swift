//
//  TipKitDemoMapApp.swift
//  TipKitDemoMap
//
//  Created by Thomas Cowern on 7/31/25.
//

import SwiftUI
import TipKit

@main
struct TipKitDemoMapApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
        }
    }
}
