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

struct ScreenErrorView: View {
    
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

struct AlertErrorView: View {
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {

                VStack {
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

struct PopupErrorView: View {
    let errorTitle: String
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .frame(height: 200)
            .padding()
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
