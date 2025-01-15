//
//  DummyDataTestApp.swift
//  DummyDataTest
//
//  Created by Thomas Cowern on 1/15/25.
//

import SwiftUI

@main
struct DummyDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(messages: PreviewData.load(name: "Messages"))
        }
    }
}
