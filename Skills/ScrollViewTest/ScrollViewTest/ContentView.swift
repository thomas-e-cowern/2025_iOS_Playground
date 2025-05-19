//
//  ContentView.swift
//  ScrollViewTest
//
//  Created by Thomas Cowern on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                ForEach(1..<11) { circle in
                    Circle()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
