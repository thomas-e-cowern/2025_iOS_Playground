//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Thomas Cowern on 2/7/25.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
