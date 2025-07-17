//
//  ResuableToobarButtonApp.swift
//  ResuableToobarButton
//
//  Created by Thomas Cowern on 7/17/25.
//

import SwiftUI
import SwiftData

@main
struct ResuableToobarButtonApp: App {
    
    let thanks: [Thanks] = []
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Thanks.self)
        }
    }
}
