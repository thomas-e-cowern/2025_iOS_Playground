//
//  ErrorHandling.swift
//  CGTPErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import Foundation
import SwiftUI

struct ErrorAlert: Identifiable {
    let id = UUID()
    let message: String
    var dismissAction: (() -> Void)?
}

@Observable
class ErrorHandling {
    
    var currentAlert: ErrorAlert?
    
    func handle(error: Error) {
        currentAlert = ErrorAlert(message: error.localizedDescription)
        // You can add more sophisticated error handling logic here,
        // like logging the error or presenting different types of alerts based on error type.
    }
}
