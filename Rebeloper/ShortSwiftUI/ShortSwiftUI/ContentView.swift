//
//  ContentView.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    
    var body: some View {
        VStack {
            Image(systemName: "sun.max.circle")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
            Text(name)
                .foregroundStyle(.red)
                .background(.orange)
//            Divider()
//            Color.green
                .font(.largeTitle)
            Button("Tap Me") {
                print("Tapped")
            }
//            .overlay(alignment: .bottomLeading) {
//                Text("Hey There!")
//            }
            TextField("Name", text: $name)
            
        }
        .padding()
        .onAppear {
            print("948 jklahsflhs")
        }
    }
}

#Preview {
    ContentView()
}
