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
                        switch error {
                        case .invalidURL:
                            print("Invalid URL")
                            errorMessage = "The URL appears to be invalid."
                        case .noData:
                            print("No data received")
                            errorMessage = "No data was recieved from the server"
                        }
                    } catch {
                        print("Error: \(error.localizedDescription)")
                        hasError = true
                        errorMessage = "The data is not in the correct format"
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
