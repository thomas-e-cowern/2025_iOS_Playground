//
//  ContentView.swift
//  LocalNotificationsDemo
//
//  Created by Thomas Cowern on 8/5/25.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All Set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
