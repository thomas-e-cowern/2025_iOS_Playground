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
//        name = instant()

        delayed { value in
            self.name = value
        }
    }
    
    func instant() -> String {
        return "Burl!"
    }
    
    func delayed(completion: @escaping (String) -> Void) {

        delay(2) {
            completion("Burlington!")
        }
    }
    
    // MARK: - Helpers to simulate delay
    func delay(_ seconds: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            closure()
        }
    }
}

#Preview {
    ContentView()
}
