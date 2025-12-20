//
//  iDineApp.swift
//  iDine
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @State var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(order)
        }
    }
}
