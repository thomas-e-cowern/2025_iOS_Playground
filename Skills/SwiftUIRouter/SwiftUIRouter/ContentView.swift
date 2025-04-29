//
//  ContentView.swift
//  SwiftUIRouter
//
//  Created by Thomas Cowern on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    
    // Step five add environment to main view
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button {
                router.navigateToFirstVIew()
            } label: {
                Text("First View")
            }
            Button {
                router.navigateToSecindVIew()
            } label: {
                Text("Second View")
            }
            Button {
                router.navigateToThirdVIew()
            } label: {
                Text("Third View")
            }

        }
        .padding()
    }
}

#Preview {
    
    @Previewable @Environment(Router.self) var router
    
    ContentView()
        .environment(router)
}
