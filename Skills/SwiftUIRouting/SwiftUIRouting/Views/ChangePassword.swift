//
//  ChangePassword.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct ChangePassword: View {
    
    @EnvironmentObject var router: Router<AppRoutes>
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "pencil.circle.fill")
                    .font(.largeTitle)
                Text("Change Password View")
                    .font(.largeTitle)
            }
            
            Button {
                // More to come...
            } label: {
                Image(systemName: "arrow.left")
            }
            .buttonStyle(.bordered)

        }
    }
}

#Preview {
    ChangePassword()
        .environmentObject(Router<AppRoutes>())
}
