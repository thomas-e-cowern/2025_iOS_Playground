//
//  Home.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "house")
                    .font(.largeTitle)
                Text("Home View")
                    .font(.largeTitle)
            }
            
            Button {
                // More to come...
            } label: {
                Text("Profile")
                    .frame(maxWidth: .infinity, minHeight: 45)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                // More to come...
            } label: {
                Text("Settings")
                    .frame(maxWidth: .infinity, minHeight: 45)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                // More to come...
            } label: {
                Text("Notifications")
                    .frame(maxWidth: .infinity, minHeight: 45)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()

        }
        .padding()
    }
}

#Preview {
    Home()
}
