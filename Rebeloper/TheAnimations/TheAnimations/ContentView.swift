//
//  ContentView.swift
//  TheAnimations
//
//  Created by Thomas Cowern on 4/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
           Rectangle()
                .fill(.orange)
                .frame(width: isExpanded ? 300 : 100, height: 100)
            
            Rectangle()
                 .fill(.mint)
                 .frame(width: isExpanded ? 300 : 100, height: 100)
            
            Button("Toggle") {
                isExpanded.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
