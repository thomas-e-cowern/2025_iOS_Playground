//
//  ErrorHanlderTestApp.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

@main
struct ErrorHanlderTestApp: App {
    
    @State private var errorCenter = ErrorCenter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(errorCenter)     // make available everywhere
        }
    }
}
