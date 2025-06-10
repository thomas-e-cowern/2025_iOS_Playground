//
//  ContentView.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router<AppRoutes>
    
    var body: some View {
        VStack {
            RoutingView(stack: $router.stack) {
                Home()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Router<AppRoutes>())
}
