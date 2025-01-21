//
//  ErrorView.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//

import SwiftUI

struct ErrorView: View {
    
    let errorTitle: String
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {
                
                VStack {
                    Text(errorTitle)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Button("Reload Users") {
                        Task {
                            await usersViewModel.loadUsers(withError: false)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            }
    }
}
