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
            HStack {
                ZStack {
                    TextField("Password", text: $password)
                    SecureField("Password", text: $password)
                }
                .textFieldStyle(.roundedBorder)
                
                Button {
                    // More to come...
                } label: {
                    Image(systemName: "eye.slash")
                }

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
