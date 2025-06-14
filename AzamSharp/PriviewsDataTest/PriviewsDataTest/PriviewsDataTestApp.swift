//
//  PriviewsDataTestApp.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import SwiftUI

@main
struct PriviewsDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(httpClient: HTTPClient())
        }
    }
}
