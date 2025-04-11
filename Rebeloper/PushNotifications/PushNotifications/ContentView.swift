//
//  ContentView.swift
//  PushNotifications
//
//  Created by Thomas Cowern on 4/11/25.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    var body: some View {
        VStack {
            Button {
                Task {
                    do {
                        print("doing...")
                        try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
                    } catch {
                        print(error.localizedDescription)
                    }
                }
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
