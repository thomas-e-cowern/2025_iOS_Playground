//
//  HealthKitPlaygroundApp.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import SwiftUI

@main
struct HealthKitPlaygroundApp: App {
    
    @State var healthManager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(HealthManager())
        }
    }
}
