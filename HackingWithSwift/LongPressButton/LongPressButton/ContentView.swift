//
//  ContentView.swift
//  LongPressButton
//
//  Created by Thomas Cowern on 7/21/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LongPressButton(image: Image(systemName: "bolt.fill")) {
                print("Activated!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
