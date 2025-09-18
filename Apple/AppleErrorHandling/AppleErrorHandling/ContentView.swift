//
//  ContentView.swift
//  AppleErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .sheet(item: $errorWrapper) {
            dismiss()
        } content: { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
}

#Preview {
    ContentView()
}
