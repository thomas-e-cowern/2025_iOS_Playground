//
//  ContentView.swift
//  ASValidation
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var validationErrors: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                    Button("Login") {
                        if validateForm() {
                            // authenticate user
                        }
                    }
                    
                    if !validationErrors.isEmpty {
                        ValidationSummaryView(validationErrors: validationErrors)
                    }
                }
            }
            .navigationTitle("Login")
        }
    }
    
    private func validateForm() ->  Bool {
        validationErrors.removeAll()
        
        if username.trimmingCharacters(in: .whitespaces).isEmpty {
            validationErrors.append("Username is required.")
        }
        
        if password.trimmingCharacters(in: .whitespaces).isEmpty {
            validationErrors.append("Password is required.")
        }
        
        return validationErrors.isEmpty
    }
}

#Preview {
    ContentView()
}
