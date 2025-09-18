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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(errorHandling)
                .alert(item: $errorHandling.currentAlert) { alert in
                    Alert(
                        title: Text("Error"),
                        message: Text(alert.message),
                        dismissButton: .default(Text("OK"), action: alert.dismissAction)
                    )
                }
        }
    }
}
