//
//  ContentView.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ErrorCenter.self) private var errorCenter
    
    @State private var response: Int = 0
    
    var body: some View {
        NavigationStack {
            
            List {
                NavigationLink("Go to Details") {
                    DetailsView()
                }
            }
            .navigationTitle("Home")
            
            if response == 1 {
                Text("Everything is good....")
            }
            

            Button("Trigger Conenction Error") {
                response = 1
                if response == 0 {
                    errorCenter.handle(AppError.connectionError("There is a problem connecting..."))
                }
            }
                
                

            
            Spacer()
            
        }
        .globalErrorAlert()
    }
}

#Preview {
    ContentView()
        .environment(ErrorCenter())
}
