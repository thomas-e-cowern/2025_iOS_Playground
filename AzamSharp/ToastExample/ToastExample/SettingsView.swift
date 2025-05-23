//
//  SettingsView.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//

import SwiftUI

struct SettingsView: View {
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
                // More to come...
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    SettingsView()
}
