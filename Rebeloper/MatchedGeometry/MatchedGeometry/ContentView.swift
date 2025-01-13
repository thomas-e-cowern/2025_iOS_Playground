//
//  ContentView.swift
//  MatchedGeometry
//
//  Created by Thomas Cowern on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.red)
                    .matchedGeometryEffect(id: "circle", in: namespace, properties: .frame, anchor: .center, isSource: true)
                    .frame(width: 200, height: 200)
                Circle()
                    .fill(.green)
                    .matchedGeometryEffect(id: "\(isActive   ? "circle" : "")", in: namespace, properties:.position ,anchor: .center, isSource: false)
                    .frame(width: 100, height: 100)
            }
            .padding()
            Button("Click Me 👆") {
                withAnimation {
                    isActive.toggle()
                } completion: {
                    // more here
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
