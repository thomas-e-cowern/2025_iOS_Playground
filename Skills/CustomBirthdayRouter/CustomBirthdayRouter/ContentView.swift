//
//  ContentView.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button {
                router.navigateTo(route: .settings)
            } label: {
                Text("Go to settings")
            }
            
            Button {
                router.navigateTo(route: .home)
            } label: {
                Text("Home")
            }


        }
        .padding()
    }
}

#Preview {
    ContentView()
        .withRouter()
}
