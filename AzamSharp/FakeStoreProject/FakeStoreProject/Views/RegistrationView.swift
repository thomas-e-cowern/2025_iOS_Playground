//
//  RegistrationView.swift
//  FakeStoreProject
//
//  Created by Thomas Cowern on 7/23/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var registrationForm = RegistrationForm()
    @State private var errors: [String] = []
    
    var body: some View {
        Form {
            TextField("Name", text: $registrationForm.name)
            TextField("Email", text: $registrationForm.email)
            SecureField("Password", text: $registrationForm.password)
            Button {
                errors = registrationForm.validate()
            } label: {
                Text("Register")
            }
            
            if !errors.isEmpty {
                ValidationSummaryVIew(errors: errors)
            }

        }
    }
}

#Preview {
    RegistrationView()
}
