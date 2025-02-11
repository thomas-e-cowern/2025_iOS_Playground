//
//  ContentView.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    private var vm = UsersViewModel()
    
    var body: some View {
        VStack {
            Button("Get Users") {
                Task{
                     do{
                         users = try await vm.fetchUsers()
                     }catch{
                          print(error)
                          //handle the error
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
