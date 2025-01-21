//
//  AlertModifierErrorView.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//

import SwiftUI

struct AlertModifierErrorView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            List(usersViewModel.listUsers, id: \.self) { user in
                Text(user)
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(2))
            await usersViewModel.loadUsers(withError: true)
        }
        .onChange(of: usersViewModel.userError, { _, newValue in
            showAlert = newValue != nil
        })
        .alert(usersViewModel.userError?.description ?? "", isPresented: $showAlert) {
            ErrorView(errorTitle: "", usersViewModel: usersViewModel)
        }
    }
}

#Preview {
    AlertModifierErrorView()
}
