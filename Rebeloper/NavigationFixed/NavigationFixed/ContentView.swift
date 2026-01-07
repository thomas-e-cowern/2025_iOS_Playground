//
//  ContentView.swift
//  NavigationFixed
//
//  Created by Thomas Cowern on 12/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isPresented.toggle()
            } label: {
                Label("Click here....", systemImage: "house")
            }
            .sheet(isPresented: $isPresented) {
                print("Dismissed")
            } content: {
                DestinationView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
