//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Thomas Cowern on 10/30/25.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @State var dateManager: DateManager = DateManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dateManager)
        }
    }
}
