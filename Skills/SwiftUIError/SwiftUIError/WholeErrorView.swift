//
//  WholeErrorView.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//

import SwiftUI

struct WholeErrorView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    
    var body: some View {
        ZStack {
            List(usersViewModel.listUsers, id: \.self) { user in
                Text(user)
            }
            
            if let error = usersViewModel.userError { // << error handling here
                WholeErrorView(usersViewModel: usersViewModel)
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(2)) // timer to fake the network request
            await usersViewModel.loadUsers(withError: true) // calling the fake function with error
        }
    }
}

#Preview {
    WholeErrorView()
}
