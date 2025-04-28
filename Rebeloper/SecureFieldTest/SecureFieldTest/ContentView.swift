//
//  ContentView.swift
//  SecureFieldTest
//
//  Created by Thomas Cowern on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            VisibleSecureFieldView(text: $password)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
