//
//  ContentView.swift
//  MacroPlayground
//
//  Created by Thomas Cowern on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    
//    @Environment(AppController.self) private var appController
    
    @Environment(\.appController) private var appController
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(appController.text)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
