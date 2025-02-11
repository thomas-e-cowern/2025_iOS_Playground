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
    
    var body: some View {
        VStack {
            List {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
            .alert(errorMessage ?? "Nada", isPresented: $hasError) {
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
                        switch error.code {
                        case .badURL:
                            errorMessage = "Something is wrong with the URL..."
                        case .unsupportedURL:
                            errorMessage = "The URL is not supported at this time...."
                        case .cannotConnectToHost:
                            errorMessage = "We were not able to connect to the host..."
                        case .notConnectedToInternet:
                            errorMessage = "You do not appear to have internet access"
                        default:
                            errorMessage = "An unknown error occurred..."
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
