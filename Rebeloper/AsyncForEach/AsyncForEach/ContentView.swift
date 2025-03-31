//
//  ContentView.swift
//  AsyncForEach
//
//  Created by Thomas Cowern on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Tap me") {
                (1...10).forEach { index in
                    countUp(index)
                }
            }
        }
        .padding()
    }
    
    func countUp(_ index: Int) {
        print(index)
    }
}

#Preview {
    ContentView()
}
