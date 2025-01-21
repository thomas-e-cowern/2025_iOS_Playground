//
//  ErrorView.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//


import SwiftUI

enum ErrorType {
    case alertModifierError
    case wholeError
}

struct ErrorView: View {
    
    let errorType: ErrorType
    let errorTitle: String?
    
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {
                
                switch errorType {
                case .alertModifierError:
                    VStack {
                        Button("Reload Users") {
                            Task {
                                await usersViewModel.loadUsers(withError: false)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                case .wholeError:
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
