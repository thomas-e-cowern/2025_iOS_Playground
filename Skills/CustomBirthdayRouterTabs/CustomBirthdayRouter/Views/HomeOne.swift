//
//  HomeOne.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct HomeOne: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Text("Home One")
            
            Button {
                router.navigateTo(route: .homeTwo)
            } label: {
                Text("Go to Home 2")
            }

        }
    }
}

#Preview {
    HomeOne()
        .withRouter()
}
