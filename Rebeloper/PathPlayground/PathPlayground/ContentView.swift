//
//  ContentView.swift
//  PathPlayground
//
//  Created by Thomas Cowern on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
//                NavigationLink(value: 0) {
//                    Text("Navigate to 0")
//                }
//                
//                NavigationLink(value: "Zero") {
//                    Text("Navigate to zero")
//                }
                
                Button {
                    path.append(0)
                } label: {
                    Text("Navigate to 0")
                }
                
                Button {
                    path.append("Zero")
                } label: {
                    Text("Navigate to Zero")
                }

            }
            .navigationDestination(for: Int.self) { value in
                Text("Int Value: \(value)")
            }
            .navigationDestination(for: String.self) { value in
                Text("String Value: \(value)")
            }
        }
    }
}

#Preview {
    ContentView()
}
