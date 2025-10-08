//
//  ApiServiceTestApp.swift
//  ApiServiceTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

@main
struct ApiServiceTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withMockData()  
        }
    }
}
