//
//  VisibleSecureFieldView.swift
//  SecureFieldTest
//
//  Created by Thomas Cowern on 4/28/25.
//
import SwiftUI

struct VisibleSecureFieldView: View {
    
    @Binding var text: String
    @State private var showPassword: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                TextField("Password", text: $text)
                    .opacity(showPassword ? 1 : 0)
                SecureField("Password", text: $text)
                    .opacity(showPassword ? 0 : 1)
            }
            
            Spacer(minLength: 0)
            
            // Show password
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" :"eye")
            }
            .buttonStyle(.plain)
            
            // Clear password
            Button {
                text = ""
            } label: {
                Image(systemName: "x.circle")
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
}
