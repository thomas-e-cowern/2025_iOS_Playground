//
//  ContentView.swift
//  FunctionAttributes
//
//  Created by Thomas Cowern on 3/12/25.
//

import SwiftUI

extension View  {
    @warn_unqualified_access
    func titleStyle() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.red)
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(Color.blue)
                .clipShape(.capsule)
                .titleStyle()
        }
        .padding()
        
        
    }
}

#Preview {
    ContentView()
}
