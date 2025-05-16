//
//  ContentView.swift
//  GroupBoxTest
//
//  Created by Thomas Cowern on 5/16/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            GroupBox {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Toggle(isOn: .constant(true)) {
                    Text("This is on...")
                }
                Toggle(isOn: .constant(false)) {
                    Text("This is off...")
                }
            }
            .background(colorScheme == .dark ? Color.black : Color.gray)
        }
        .padding()
    }
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
