//
//  ErrorWrapper.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import Foundation

struct ErrorModel: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
    let contactSupport: String
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String?
}

enum ErrorType: LocalizedError {
    case operationFailed
    case urlUnavailable
}

//extension ErrorType {
//    var errorDescription: String? {
//        switch self {
//            case .operationFailed:
//            return "Sorry, but the operation failed and we couldn't complete it. Please try again later. \n\nIf you have continued problems please contact user support."
//        }
//    }
//}

extension ErrorType {
    var error: ErrorModel? {
        switch self {
            case .operationFailed:
            return ErrorModel(error: ErrorType.operationFailed, guidance: "Something went wrong, please try again later.", contactSupport: "If this error persists, please contact user support.")
            
        case .urlUnavailable:
            return ErrorModel(error: ErrorType.urlUnavailable, guidance: "The URL you entered is unavailable.", contactSupport: "Please check the URL address and try again.")
        }
    }
}
