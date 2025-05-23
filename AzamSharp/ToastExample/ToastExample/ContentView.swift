//
//  ContentView.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.showToast) private var showToast
    
    var body: some View {
        VStack {
            Button("Show Toast") {
                showToast(.success("Successful"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
        .withToast()
}
