//
//  CustomErrors.swift
//  ErrorAlertPlayground
//
//  Created by Thomas Cowern on 1/23/25.
//

import Foundation

enum CustomErrors: Error, LocalizedError {
    case noInternetConnection
    case dataNotAvailable
    case urlError(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "Please check your internet connection and try again."
        case .dataNotAvailable:
            return "Data is currently not available. Please try again later."
        case .urlError(error: let error):
            return "URL Error: \(error.localizedDescription)"
        }
    }
}
