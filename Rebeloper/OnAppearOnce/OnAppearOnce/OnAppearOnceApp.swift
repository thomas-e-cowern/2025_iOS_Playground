//
//  OnAppearOnceApp.swift
//  OnAppearOnce
//
//  Created by Thomas Cowern on 5/15/25.
//

import SwiftUI

@main
struct OnAppearOnceApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environment(OnFirstAppearObservable())
        }
    }
}
