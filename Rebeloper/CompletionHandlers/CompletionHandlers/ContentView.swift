//
//  ContentView.swift
//  CompletionHandlers
//
//  Created by Thomas Cowern on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = "World"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, \(name)")
        }
        .padding()
        
        Button("Change Name") {
            buttonTapped()
        }
    }
    
    func buttonTapped() {
        // MARK: TODO - Add buttonTapped function
    }
    
    
    
    // MARK: - Helpers to simulate delay
    func delay(_ seconds: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            
        }
    }
}

#Preview {
    ContentView()
}
