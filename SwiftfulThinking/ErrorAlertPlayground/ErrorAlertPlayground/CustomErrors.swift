//
//  CustomErrors.swift
//  ErrorAlertPlayground
//
//  Created by Thomas Cowern on 1/23/25.
//

import Foundation
import SwiftUI

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

enum CustomAlertss: Error, LocalizedError {
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
    
    var title: String {
        switch self {
        case .noInternetConnection:
            return "Internet unavailable"
        case .dataNotAvailable:
            return "Data unavailable"
        case .urlError:
            return "Url unavailable"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .noInternetConnection:
            return "No internet connection is available"
        case .dataNotAvailable:
            return nil
        case .urlError(let error):
            return "The url you gave us is shit.... \(error.localizedDescription)"
        }
    }
    
    @ViewBuilder
    func alertFormat() -> some View {
        switch self {
        case .noInternetConnection:
            Button("Ok") {
                    
            }
        case .dataNotAvailable:
            Button("Retry") {
                    
            }
        default:
            Button("Delete", role: .destructive) {
                    
            }
        }
    }
}


