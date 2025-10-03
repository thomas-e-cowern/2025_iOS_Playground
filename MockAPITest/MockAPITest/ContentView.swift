//
//  ContentView.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    
    let mockCapsule: [CapsuleElement] = load("CapsuleData.json")
    
    var body: some View {
        VStack {
            ForEach(mockCapsule, id: \.self) { capsule in
                Text(capsule.status)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
