//
//  MockDataTestApp.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

@main
struct MockDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.dataService, RealDataService())
            #if DEBUG
                .environment(\.dataService, MockDataService())
            #endif
        }
    }
}
