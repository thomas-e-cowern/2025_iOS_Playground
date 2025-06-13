//
//  ContentView.swift
//  AlertsPlayground
//
//  Created by Thomas Cowern on 6/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNetworkAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            Button {
                isShowingNetworkAlert.toggle()
            } label: {
                Text("Fetch Data")
            }
            .alert("No Network", isPresented: $isShowingNetworkAlert) {
                Button("Try again later") {
                    // Do whatever to try again
                }
                
                Button("Delete", role: .destructive) {
                    // Delete whatever...
                }
                
                Button("Cancel", role: .cancel) {
                    // Don't have to do shit...
                }
            } message: {
                Text("No network connection. Please try again later.")
            }
            
            Button {
                // More to come...
            } label: {
                Text("Enter Data")
            }
            
            Button {
                // More to come...
            } label: {
                Text("Log in")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
