//
//  Extensions+ModelContainer.swift
//  iTour
//
//  Created by Thomas Cowern on 10/15/25.
//

import SwiftUI
import SwiftData

extension ModelContainer {
    static var preview: ModelContainer {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Destination.self, configurations: config)

            // Add sample data
            Task { @MainActor in
                let context = container.mainContext
                for i in 1...5 {
                    let sampleItem = Destination(name: "Destination \(i)")
                    context.insert(sampleItem)
                }
            }
            return container
        } catch {
            fatalError("Failed to create preview ModelContainer: \(error.localizedDescription)")
        }
    }
}

