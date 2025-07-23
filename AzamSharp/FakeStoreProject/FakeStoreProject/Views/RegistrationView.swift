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
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button {
                // More to come...
            } label: {
                Text("Register")
            }

        }
    }
}

#Preview {
    RegistrationView()
}
