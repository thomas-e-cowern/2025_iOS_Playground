//
//  UsersViewModel.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var listUsers = [String]()
    @Published var userError: UserError? = nil
    
    @MainActor
    func loadUsers(withError: Bool) async {
        if withError {
            userError = UserError.failedLoading
        } else {
            userError = nil
            listUsers = ["ninha", "Mike", "Pepijn"]
        }
    }
}

enum UserError: Error {
    case failedLoading
    
    var description: String {
        switch self {
        case .failedLoading:
            return "Sorry, we couldn't retrieve users. \n Try again later. ☹️"
        }
    }
}
