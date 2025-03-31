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
                Task {
                    try await (1...10).asyncForEach { index in
                        try await countUp(index)
                    }
                }
            }
        }
        .padding()
    }
    
    func countUp(_ index: Int) async throws {
        try await Task.sleep(for: .seconds(1))
        print(index)
    }
}

#Preview {
    ContentView()
}

extension Sequence {
    func asyncForEach(_ operations: (Element) async throws -> Void) async rethrows {
        for element in self {
            try await operations(element)
        }
    }
}
