//
//  ContentView.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Tab {
                    Text("Doctor Screen")
                }
                
                Tab {
                    Text("Patient Screen")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
