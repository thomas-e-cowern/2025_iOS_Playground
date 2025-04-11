//
//  ContentView.swift
//  PushNotifications
//
//  Created by Thomas Cowern on 4/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                // 
            } label: {
                Text("Request Push Notification Access")
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
