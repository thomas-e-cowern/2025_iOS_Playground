//
//  Home.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct Home: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "house")
                Text("Home")
            }
            
            Button {
                router.navigateTo(route: .settings)
            } label: {
                Text("Go to settings")
            }
        }
    }
}

#Preview {
    Home()
        .withRouter()
}
