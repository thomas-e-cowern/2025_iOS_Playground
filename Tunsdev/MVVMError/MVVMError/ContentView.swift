//
//  ContentView.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var errorMessage: String? = nil
    @State private var users: [User] = []
    @State private var vm = UsersViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
            .alert("There was a problem fetching users", isPresented: $vm.hasError) {
                Button("Ok") {}
            } message: {
                Text(errorMessage ?? "Something went wrong")
            }

            
            
            Button("Get Users") {
                Task{
                     do{
                         users = try await vm.fetchUsers()
                     }catch{
                         print(error.localizedDescription)
                          //handle the error
                         vm.hasError = true
                         errorMessage = vm.error?.localizedDescription
                     }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
