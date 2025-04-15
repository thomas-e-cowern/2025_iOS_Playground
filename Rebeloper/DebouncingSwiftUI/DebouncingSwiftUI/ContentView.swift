//
//  ContentView.swift
//  DebouncingSwiftUI
//
//  Created by Thomas Cowern on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    @State private var debouncdedText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TextField("Text", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                Text(debouncdedText)
                    .bold()
                    .padding(.horizontal, 6)
            }
            .padding()
        }
        .navigationTitle("Debounce Text Input")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
