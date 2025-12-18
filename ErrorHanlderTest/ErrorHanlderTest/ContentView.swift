//
//  ContentView.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ErrorCenter.self) private var errorCenter
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Go to Details") {
                    DetailsView()
                }
            }
            .navigationTitle("Home")
            
            Button("Trigger Conenction Error") {
                errorCenter.handle(AppError.connectionError("We are unable to connect at this time. Please try again later."))
            }
        }
        .globalErrorAlert()
    }
}

#Preview {
    ContentView()
        .environment(ErrorCenter())
}
