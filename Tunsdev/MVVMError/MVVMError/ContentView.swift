//
//  ContentView.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var errorMessage: String? = ""
    @State private var users: [User] = []
    @State private var vm = UsersViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
            .alert("Uh oh, something went wrong!", isPresented: $vm.hasError) {
                Button("Ok") {
                    
                }
            } message: {
                Text(vm.networkError?.description ?? "")
            }

            
            
            Button("Get Users") {
                Task{
                     do{
                         users = try await vm.fetchUsers()
                     } catch {
//                         print(vm.error?.localizedDescription)
                          //handle the error
                         vm.hasError = true
                         errorMessage = vm.networkError?.localizedDescription
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
