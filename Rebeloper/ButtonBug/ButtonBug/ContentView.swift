//
//  ContentView.swift
//  ButtonBug
//
//  Created by Thomas Cowern on 4/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            //
        } label: {
            Text("Tap Me")
                .foregroundStyle(.borderProminentLabel)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview("Light Mode") {
    ContentView()
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
