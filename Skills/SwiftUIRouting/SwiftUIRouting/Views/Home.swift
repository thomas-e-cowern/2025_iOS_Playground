//
//  Home.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var router: Router<AppRoutes>
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "house")
                    .font(.largeTitle)
                Text("Home View")
                    .font(.largeTitle)
            }
            
            Button {
                router.navigate(to: .profile)
            } label: {
                Text("Profile")
                    .frame(maxWidth: .infinity, minHeight: 45)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                router.navigate(to: .settings)
            } label: {
                Text("Settings")
                    .frame(maxWidth: .infinity, minHeight: 45)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                router.navigate(to: .notifications)
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
        .environmentObject(Router<AppRoutes>())
}
