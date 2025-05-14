//
//  ContentView.swift
//  EnumViews
//
//  Created by Thomas Cowern on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isResultSuccessfull: Bool = false
    
    var body: some View {
        VStack {
            Button("Toggle Result") {
                isResultSuccessfull.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
