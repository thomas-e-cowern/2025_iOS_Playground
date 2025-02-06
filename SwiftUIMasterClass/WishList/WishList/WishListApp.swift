//
//  WishListApp.swift
//  WishList
//
//  Created by Thomas Cowern on 2/6/25.
//

import SwiftUI
import SwiftData

@main
struct WishListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
