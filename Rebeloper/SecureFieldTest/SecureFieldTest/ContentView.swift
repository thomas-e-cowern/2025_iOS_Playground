//
//  ContentView.swift
//  SecureFieldTest
//
//  Created by Thomas Cowern on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
