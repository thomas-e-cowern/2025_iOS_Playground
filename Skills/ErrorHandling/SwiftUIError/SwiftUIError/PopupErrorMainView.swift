//
//  PopupErrorMainView.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//

import SwiftUI

struct PopupErrorMainView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    @State var showError = false
    
    var body: some View {
        VStack {
            List(usersViewModel.listUsers, id: \.self) { user in
                Text(user)
            }.overlay {
                if showError {
                    VStack {
                        PopupErrorView(errorTitle: usersViewModel.userError?.description ?? "", usersViewModel: usersViewModel)
                        
                        Spacer()
                    }.transition(.move(edge: .top))
                }
            }.transition(.move(edge: .top))
        }
        .animation(.default, value: usersViewModel.userError)
        .task {
            try? await Task.sleep(for: .seconds(1))
            await usersViewModel.loadUsers(withError: true)
        }
        .onChange(of: usersViewModel.userError) { _, newValue in
            showError = newValue != nil
        }
    }
}

#Preview {
    PopupErrorMainView()
}
