//
//  ContentView.swift
//  Toasts
//
//  Created by Thomas Cowern on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Present Toast") {
                
            }
            .buttonStyle(.borderedProminent)
            
            Button("Dismiss Toast") {
                
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    // MARK: - Methods and functions
    func icon() -> some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .foregroundStyle(.orange)
    }
    
    func actions() -> some View {
        Button {
            
        } label: {
            Text("Dismiss")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
