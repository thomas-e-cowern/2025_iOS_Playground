//
//  EditProfile.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct EditProfile: View {
    
    @EnvironmentObject var router: Router<AppRoutes>
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .font(.largeTitle)
                Text("Edit Profile View")
                    .font(.largeTitle)
            }
            
            Button {
                router.navigateToRoot()
            } label: {
                Image(systemName: "house")
                    .font(.largeTitle)
                Text("Home")
                    .font(.largeTitle)
            }
            .buttonStyle(.borderedProminent)

        }
    }
}

#Preview {
    EditProfile()
        .environmentObject(Router<AppRoutes>())
}
