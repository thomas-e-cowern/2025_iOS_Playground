//
//  ContentView.swift
//  Errors
//
//  Created by Thomas Cowern on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var hasError: Bool = false
    @State var errorMessage: String?
    @State private var users: [User] = []
    @State private var vm = UserViewModel()
    @State var eh: ErrorHandler
    
    var body: some View {
        VStack {
            List {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
            .alert(eh.errorTitle, isPresented: $eh.showError) {
                Button("OK") {
                        
                }
            }
            .onAppear {
                Task {
                    do {
                        users = try await vm.fetchUsers()
                        // Process data
                    } catch let error as NetworkError {
                        hasError = true
                        if error == .invalidURL {
                            errorMessage = "Uh oh, something went wrong..."
                        }
                    } catch let error as URLError {
                        hasError = true
                        let error = eh.handleUrlError(errorCode: error.code)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(eh: ErrorHandler(errorTitle: "Preview Error", errorDescription: "Preview Description", showError: false))
}
