//
//  TipKitSecretsApp.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 1/14/25.
//

import SwiftUI
import TipKit

@main
struct TipKitSecretsApp: App {
    
    init () {
        // resetDatastore must be removed before shipping
        try? Tips.resetDatastore()
        
        // Tips configuration goes here
        try? Tips.configure([
            .displayFrequency(.monthly)
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
