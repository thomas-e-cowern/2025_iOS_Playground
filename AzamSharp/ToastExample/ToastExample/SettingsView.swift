//
//  SettingsView.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.showToast) var showToast
    @Environment(\.dismiss) var dismiss
    
    @State private var isLoggedIn: Bool = true
    
    var body: some View {
        VStack(spacing: 10) {
            if isLoggedIn {
                Group {
                    Text("Settings")
                        .font(.title)
                    
                    HStack {
                        Image(systemName: "person")
                        Text("John Smith")
                    }
                }
            } else {
                Text("Please log in to view settings")
            }
            
            Spacer()
                .frame(height: 50)
            
            Button(isLoggedIn ? "Log Out" : "Log In") {
                showToast(.info("You are now logged out..."))
                isLoggedIn.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:{
                    dismiss()
                })
            }
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SettingsView()
        .withToast()
}
