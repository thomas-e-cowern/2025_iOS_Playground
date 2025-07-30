//
//  ContentView.swift
//  OpaqueReturnTypes
//
//  Created by Thomas Cowern on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .onTapGesture {
                print(type(of: self.body))
                let employee = login()
                print(employee)
            }
    }
}

#Preview {
    ContentView()
}
