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
                // Specific to this view
                //.animation(.default, value: isExpanded)
            
            Rectangle()
                 .fill(.mint)
                 .frame(width: isExpanded ? 300 : 100, height: 100)
                 //.animation(.bouncy, value: isExpanded)
                // opts out of animation with transaction
                 .transaction { transaction in
                     transaction.animation = nil
                 }
            
            Button("Toggle") {
                // Will apply to both views
                withAnimation(.easeInOut(duration: 1.5)) {
                    isExpanded.toggle()
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
