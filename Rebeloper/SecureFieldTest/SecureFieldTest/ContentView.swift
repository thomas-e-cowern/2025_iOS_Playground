//
//  ContentView.swift
//  SecureFieldTest
//
//  Created by Thomas Cowern on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    TextField("Password", text: $password)
                        .opacity(showPassword ? 1 : 0)
                    SecureField("Password", text: $password)
                        .opacity(showPassword ? 0 : 1)
                }
                
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" :"eye")
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            .overlay {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(.secondary, lineWidth: 1)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
