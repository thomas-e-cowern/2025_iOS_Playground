//
//  ErrorHandler.swift
//  Errors
//
//  Created by Thomas Cowern on 2/12/25.
//

import Foundation
import SwiftUI

// Model
class ErrorModel {
    var errorTitle: String
    var errorDescription: String
    var showError: Bool
    
    init(errorTitle: String, errorDescription: String, showError: Bool) {
        self.errorTitle = errorTitle
        self.errorDescription = errorDescription
        self.showError = showError
    }
}

struct AppError: View {
   var body: some View {
        Text("An error occurred")
    }
}


@Observable
class ErrorHandler: ErrorModel {

    func handleUrlError(errorCode: URLError.Code) -> ErrorModel {
        
        errorTitle = "Error with the internet has occured"
        showError = true
        
        switch errorCode {
        case .badURL:
            errorDescription = "Something is wrong with the URL..."
        case .unsupportedURL:
            errorDescription = "The URL is not supported at this time...."
        case .cannotConnectToHost:
            errorDescription = "We were not able to connect to the host..."
        case .notConnectedToInternet:
            errorDescription = "You do not appear to have internet access"
        default:
            errorDescription = "An unknown error occurred..."
        }
        
        return ErrorModel(errorTitle: errorTitle, errorDescription: errorDescription, showError: showError)
    }
    
}
