//
//  RegistrationView.swift
//  FakeStoreProject
//
//  Created by Thomas Cowern on 7/23/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    private var isValid: Bool {
        validate().isEmpty
    }
    
    private func validate() -> [String] {
        var errors: [String] = []
        
        if name.isEmptyOrWhitespace {
            errors.append("Name cannot be emtpy.")
        }
        
        if email.isEmptyOrWhitespace {
            errors.append("Email cannot be emtpy.")
        }
        
        if !password.isValidPassword{
            errors.append("Password must be at least 8 characters long.")
        }
        
        if !email.isValidEmail {
            errors.append("Please enter a valid email address.")
        }
        
        return errors
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button {
                // More to come...
            } label: {
                Text("Register")
            }.disabled(!isValid)

        }
    }
}

#Preview {
    RegistrationView()
}
