//
//  ContentView.swift
//  ErrorAlertPlayground
//
//  Created by Thomas Cowern on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var error: Error? = nil
    
    // MARK: - Body
    var body: some View {
        VStack {
            Button("Click to Show Error") {
                saveData()
            }
//            .alert(error?.localizedDescription ?? "Unknown Error", isPresented: Binding(value: $error)) {
//                Button("OK") {
//                    
//                }
//            }
            .alert(error?.localizedDescription ?? "Unknow Error", isPresented: Binding(value: $error)) {
                Button("Ok") {
                        
                }
            } message: {
                Text("Error message goes here...")
            }

        }
        .padding()
    }
    
    // MARK: - Methods and functions
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            // do something
        } else {
            // error
            let myError: Error = CustomErrors.dataNotAvailable
            error = myError
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
