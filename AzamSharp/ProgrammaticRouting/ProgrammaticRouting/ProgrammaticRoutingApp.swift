//
//  ProgrammaticRoutingApp.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

@main
struct ProgrammaticRoutingApp: App {
    
    @State private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
        }
    }
}
