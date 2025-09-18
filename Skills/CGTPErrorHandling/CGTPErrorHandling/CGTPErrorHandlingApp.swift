//
//  CGTPErrorHandlingApp.swift
//  CGTPErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import SwiftUI

@main
struct CGTPErrorHandlingApp: App {
    
    @State private var errorHandling = ErrorHandling()
    @State private var errorHandler = ErrorHandler()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(errorHandler)
                .errorAlerts(using: errorHandler)
        }
    }
}
