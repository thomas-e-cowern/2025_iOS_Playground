//
//  Preview.swift
//  WishList
//
//  Created by Thomas Cowern on 2/6/25.
//

import SwiftUI
import SwiftData

@MainActor
struct Preview {
    let modelContainer: ModelContainer
    
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: Wish.self, configurations: config)
        } catch {
            fatalError("Coule not inittialize ModelContainer: \(error)")
        }
    }
    
    func addExamples(_ examples: [Wish]) {
        Task {
            examples.forEach { wish in
                modelContainer.mainContext.insert(wish)
            }
        }
    }
}
