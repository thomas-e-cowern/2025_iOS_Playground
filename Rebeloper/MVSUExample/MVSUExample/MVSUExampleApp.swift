//
//  MVSUExampleApp.swift
//  MVSUExample
//
//  Created by Thomas Cowern on 4/30/25.
//

import SwiftUI

@main
struct MVSUExampleApp: App {
    
    @State private var appService: AppService = AppService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appService)
        }
    }
}
