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
    
    var body: some View {
        
        @Bindable var appController = appController
        
        VStack(spacing: 0) {
            Text(appController.profile.name)
//            Image("mountain")
//                .resizable()
//                .scaledToFill()
            TextField("Enter your name", text: $appController.profile.name)
//            MyTextField(name: $appController.profile.name)
            Button("Tap Me") {
//                viewModel.name = "What's up dude..."
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
