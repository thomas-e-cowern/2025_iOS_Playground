//
//  GardenAppApp.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

@main
struct GardenAppApp: App {
    var body: some Scene {
        WindowGroup {
            VegetableTabBarView()
                .modelContainer(for: [Vegetable.self, MyGardenVegetable.self])
        }
    }
}
