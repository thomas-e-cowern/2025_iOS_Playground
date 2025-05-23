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
    
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text("Settings")
                    .font(.title)
                
                HStack {
                    Image(systemName: "person")
                    Text("John Smith")
                }
            }
            
            Spacer()
                .frame(height: 50)
            
            Button("Log Out") {
                showToast(.info("You are now logged out..."))
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
