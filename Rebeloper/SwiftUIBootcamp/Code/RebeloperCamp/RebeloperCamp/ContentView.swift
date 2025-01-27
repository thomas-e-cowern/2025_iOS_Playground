//
//  ContentView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.name)
//            Image("mountain")
//                .resizable()
//                .scaledToFill()
            MyTextField(name: $viewModel.name)
            Button("Tap Me") {
//                viewModel.name = "What's up dude..."
                viewModel.chageToThomas()
            }
        }
        .padding()
    }
}

@Observable
class ContentViewModel {
    var name = ""
    
    func chageToThomas() {
        name = "Thomas"
    }
}

#Preview {
    ContentView()
}
