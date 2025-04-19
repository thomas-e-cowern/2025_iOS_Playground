//
//  ContentView.swift
//  BindableEnvironment
//
//  Created by Thomas Cowern on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AppController.self) private var appController
    
    var body: some View {
        
        @Bindable var appController = appController
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(appController.text)
            TextField("Text", text: $appController.text)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
