//
//  ContentView.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.errorAlerts) private var errorAlerts
    
    var body: some View {
        VStack {
            Button {
                errorAlerts.present(MyError.custom)
            } label: {
                Text("Present Custom Error")
            }

            Button {
                errorAlerts.present(MyError.networkError, title: MyError.networkError.title ?? "Error")
            } label: {
                Text("Network Error")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ErrorAlerts())
}
