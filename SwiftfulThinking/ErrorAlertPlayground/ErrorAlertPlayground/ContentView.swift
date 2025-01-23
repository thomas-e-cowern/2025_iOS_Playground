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
//            .alert(error?.localizedDescription ?? "Unknown Error", isPresented: Binding(value: $error)) {
//                Button("OK") {
//                    
//                }
//            }
            .alert(alert?.title ?? "Unknow Error", isPresented: Binding(value: $alert)) {
                if let alert {
                    alert.alertFormat()
                }
               
            } message: {
                if let subtitle = alert?.subtitle {
                    Text(subtitle)
                }
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
//            let myError: Error = CustomErrors.dataNotAvailable
            let myAlert: CustomAlertss = .dataNotAvailable
            alert = myAlert
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
