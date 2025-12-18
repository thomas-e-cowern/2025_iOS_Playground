//
//  ContentView.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Go to Details") {
                    DetailsView()
                }
            }
            .navigationTitle("Home")
        }
        .globalErrorAlert()
    }
}

#Preview {
    ContentView()
        .environment(ErrorCenter())
}
