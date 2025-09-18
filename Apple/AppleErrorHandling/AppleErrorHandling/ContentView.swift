//
//  ContentView.swift
//  AppleErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var errorWrapper: ErrorWrapper?
    @State private var showError: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Button {
                showError.toggle()
            } label: {
                Text("Error!")
            }
            .buttonStyle(.borderedProminent)
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
