//
//  AddEditPlaygroundApp.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/9/25.
//

import SwiftUI
import SwiftData

@main
struct AddEditPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .modelContainer(for: Person.self)
            
        }
    }
}
