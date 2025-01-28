//
//  ContentView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var name = ""
//    @State private var viewModel = ContentViewModel()
    
    @Environment(AppController.self) private var appController
    
    // To store user defaults if necessary
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some View {
        
        @Bindable var appController = appController
        
        VStack(spacing: 0) {
            Text(appController.profile.name)
            MyTextField(name: $appController.profile.name)
            Button("Tap Me") {
                appController.changeName()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(AppController())
}
