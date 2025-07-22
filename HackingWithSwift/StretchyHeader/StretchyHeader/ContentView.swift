//
//  ContentView.swift
//  StretchyHeader
//
//  Created by Thomas Cowern on 7/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section(header:
                StretchingHeader {
                    Image("mountains")
                        .resizable()
                        .scaledToFill()

                    Text("Meh")
                }
                .frame(height: 200)
            ) {
                ForEach(0..<20) { i in
                    Text("Row \(i)")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

#Preview {
    ContentView()
}
