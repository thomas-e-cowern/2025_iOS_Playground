//
//  ContentView.swift
//  AlertsPlayground
//
//  Created by Thomas Cowern on 6/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingNetworkAlert = false
    @State private var isShowingDataAlert = false
    @State private var isShowingLoginAlert = false
    @State private var error: MyAppError = .noNetwork
    
    @State private var valueString: String = ""
    @State private var randomError = RandomizeErrors()
    
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
                isShowingDataAlert.toggle()
            } label: {
                Text("Enter Data")
            }
            .alert("Enter Value", isPresented: $isShowingDataAlert) {
                TextField("Enter item value", text: $valueString)
                Button("Submit") {
                    print(valueString)
                }
                
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Enter the dollar value of your item")
            }
            
            Button {
                isShowingLoginAlert.toggle()
                error = randomError.giveMeAnError()
            } label: {
                Text("Log in")
            }
            .alert(isPresented: $isShowingLoginAlert, error: error) { error in
                
            } message: { error in
                Text(error.failureReason ?? "Unknown error")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
