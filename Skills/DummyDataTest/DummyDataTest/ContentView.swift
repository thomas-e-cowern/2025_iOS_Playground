//
//  ContentView.swift
//  DummyDataTest
//
//  Created by Thomas Cowern on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    
    let messages: [Message]
    
    var body: some View {
        VStack {
            List(messages, id: \.id) { message in
                Text(message.title)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(messages: PreviewData.load(name: "Messages"))
}
