//
//  AppError.swift
//  AlertsPlayground
//
//  Created by Thomas Cowern on 6/13/25.
//

import Foundation

enum MyAppError: LocalizedError {
    case invalidUsername
    case invalidPassword
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case .invalidUsername:
            return "Invalid username"
        case .invalidPassword:
            return "Invalid password"
        case .noNetwork:
            return "No network connection"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .invalidUsername:
            return "The username does not exist in our database."
        case .invalidPassword:
            return "The password is incorrect."
        case .noNetwork:
            return "Please check your network connection."
        }
    }
}
