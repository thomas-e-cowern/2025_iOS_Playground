//
//  MyTextField.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

struct MyTextField: View {
    
    @Binding var name: String
    
    var body: some View {
        TextField("Enter your name", text: $name)
            .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    MyTextField(name: .constant("William"))
}
