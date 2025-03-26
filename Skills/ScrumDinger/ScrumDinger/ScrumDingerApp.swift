//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/22/25.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
