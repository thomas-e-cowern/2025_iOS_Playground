//
//  ContentView.swift
//  MatchedGeometry
//
//  Created by Thomas Cowern on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                Circle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
            }
            .padding()
            Button("Click Me 👆") {
                withAnimation {
                    // do something
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
