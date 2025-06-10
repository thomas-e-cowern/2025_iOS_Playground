//
//  Profile.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct Profile: View {
    
    @EnvironmentObject var router: Router<AppRoutes>
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .font(.largeTitle)
                Text("Profile View")
                    .font(.largeTitle)
            }
            
            Button {
                router.navigate(to: .editProfile)
            } label: {
                Image(systemName: "person.crop.circle")
                Text("Edit Profile")
            }
            .buttonStyle(.borderedProminent)

            
            Button {
                router.navigateBack(1)
            } label: {
                Image(systemName: "arrow.left")
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    Profile()
        .environmentObject(Router<AppRoutes>())
}
