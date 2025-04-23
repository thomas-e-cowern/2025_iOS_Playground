//
//  ContentView.swift
//  SizeChangeDemo
//
//  Created by Thomas Cowern on 4/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var height: CGFloat = 100
    
    var body: some View {
        VStack {
            Button("Resize") {
                if height == 100 {
                    height = CGFloat.random(in: 100...600)
                } else {
                    height = 100
                }
            }
            
            Color.orange
                .frame(height: height)
            
            
            Spacer()
            
        } //: End of VStack
    }
}

#Preview {
    ContentView()
}
