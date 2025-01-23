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
    @State private var alert: CustomAlertss? = nil
    
    // MARK: - Body
    var body: some View {
        VStack {
            Button("Click to Show Error") {
                saveData()
            }
            .showCustomAlert(alert: $alert)

        }
        .padding()
    }
    
    // MARK: - Methods and functions
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            // do something
        } else {
            let myAlert: CustomAlertss = .noInternetConnection
            alert = myAlert
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
