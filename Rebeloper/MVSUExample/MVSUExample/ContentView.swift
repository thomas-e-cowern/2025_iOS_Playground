//
//  ContentView.swift
//  MVSUExample
//
//  Created by Thomas Cowern on 4/30/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    @Observable
    class ViewModel {
        var profile: Profile = Profile()
        
        func changeName() {
            profile.name = "New Name"
        }
    }
}
