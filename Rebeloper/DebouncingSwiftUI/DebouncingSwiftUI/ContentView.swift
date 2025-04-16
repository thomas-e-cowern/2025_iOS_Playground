//
//  ContentView.swift
//  DebouncingSwiftUI
//
//  Created by Thomas Cowern on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    @State private var debouncedText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
//                TextField("Text", text: $text)
//                    .textFieldStyle(.roundedBorder)
//                    .onChange(of: text) { _, newValue in
//                        debouncedText = newValue
//                    }
//                    .debounced(text: $text, debouncedText: $debouncedText)
                
                Text(debouncedText)
                    .bold()
                    .padding(.horizontal, 6)
            }
            .padding()
        }
        .navigationTitle("Debounce Text Input")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(debouncedText: $debouncedText)
        .onChange(of: debouncedText) { oldValue, newValue in
            print(newValue)
        }
//        .debounced(text: $text, debouncedText: $debouncedText)
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
