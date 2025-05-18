//
//  ContentView.swift
//  GroupBoxTest2
//
//  Created by Thomas Cowern on 5/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GroupBox {
                Image(systemName: "globe")
                    .foregroundStyle(Color.red)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!  This is an examle of a Group Box and its contents. With a little image.  Of Course")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
