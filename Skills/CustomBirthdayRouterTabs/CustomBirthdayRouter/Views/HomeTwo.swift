//
//  HomeTwo.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct HomeTwo: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Text("Home 2")
            
            Button {
                router.popToRoot()
            } label: {
                Text("Back to Home")
            }

        }
    }
}

#Preview {
    HomeTwo()
        .withRouter()
}
