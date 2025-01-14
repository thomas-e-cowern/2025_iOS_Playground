//
//  ContentView.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var imageName = "globe"
    @State private var textValue = "Hello World"
    @State private var count = 0
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textValue)
        }
        .padding()
        
        Button("\(count)") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
        .font(.largeTitle)
        .bold()
    }
}

#Preview {
    ContentView()
}
