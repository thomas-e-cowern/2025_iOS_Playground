//
//  ContentView.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isErrorPresented: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isErrorPresented.toggle()
            } label: {
                Text("Present Error")
            }
            .alert("Error", isPresented: $isErrorPresented) {
                Button("Ok") {
                    
                }
            } message: {
                Text(MyError.custom.localizedDescription)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
