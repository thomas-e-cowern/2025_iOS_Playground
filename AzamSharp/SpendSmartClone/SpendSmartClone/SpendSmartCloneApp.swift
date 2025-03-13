//
//  SpendSmartCloneApp.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//

import SwiftUI
import SwiftData

struct ModelContainerFactory {
    
    @MainActor static func create() -> ModelContainer {
        
        var container: ModelContainer!
        
        let configuration = ModelConfiguration(for: BudgetCategory.self, isStoredInMemoryOnly: false)
        container = try! ModelContainer(for: BudgetCategory.self, configurations: configuration)
        
        return container
    }
}


@main
struct SpendSmartCloneApp: App {
    
    var container: ModelContainer
    
    init() {
        container = ModelContainerFactory.create()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
