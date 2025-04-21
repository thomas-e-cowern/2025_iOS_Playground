//
//  ContentView.swift
//  AppIntentDemo
//
//  Created by Thomas Cowern on 4/21/25.
//

import SwiftUI
import _AppIntents_SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @FocusState private var focusedField: FocusedField?
    
    @AppStorage("isVisible") private var isVisible: Bool = true
    
    var body: some View {
        VStack {
            SiriTipView(intent: FocusedTextFieldIntent(), isVisible: $isVisible)
                .padding()
            Spacer()
            
            TextField("Email", text: $email)
                .focused($focusedField, equals: .email)
            
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
            
            
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .onChange(of: AppIntentController.shared.focusedField) { _, newValue in
            focusedField = newValue
        }
    }
}

#Preview {
    ContentView()
}
