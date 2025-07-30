//
//  TipKitDemoApp.swift
//  TipKitDemo
//
//  Created by Thomas Cowern on 7/30/25.
//

import SwiftUI
import TipKit

@main
struct TipKitDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
//                    try? Tips.resetDatastore()
                    try? Tips.configure(
                        [
                            .displayFrequency(.immediate),
                            .datastoreLocation(.applicationDefault),
                        ]
                    )
                }
        }
    }
}
