//
//  ContentView.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.showToast) private var showToast
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Toast") {
                showToast(.success("Successful"))
            }
            
            Button("Show Settings") {
                isPresented.toggle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .sheet(isPresented: $isPresented) {
            SettingsView()
                .withToast()
        }
    }
}

#Preview {
    ContentView()
        .withToast()
}
