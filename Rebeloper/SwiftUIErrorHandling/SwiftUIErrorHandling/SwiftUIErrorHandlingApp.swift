//
//  SwiftUIErrorHandlingApp.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import SwiftUI

@main
struct SwiftUIErrorHandlingApp: App {
    
    @State private var errorAlerts = ErrorAlerts()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .modifier(ErrorAlertsViewModifier())
//                .environment(\.errorAlerts, errorAlerts)
                .usesErrorAlerts()
        }
        
    }
}
