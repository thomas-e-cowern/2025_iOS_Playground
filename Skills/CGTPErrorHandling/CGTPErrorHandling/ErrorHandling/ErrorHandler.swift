//
//  ErrorHandler.swift
//  CGTPErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import Foundation
import SwiftUI

/// A lightweight, user-facing error payload
struct UserError: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let message: String
    let suggestion: String?
}

/// Observable handler you can put in the environment
@MainActor
@Observable
final class ErrorHandler {
    var current: UserError?

    /// Call this from anywhere you catch an Error
    func handle(_ error: Error, context: String? = nil) {
        current = Self.map(error, context: context)
    }

    /// Central place to translate technical errors into plain language
    private static func map(_ error: Error, context: String?) -> UserError {
        // 1) Handle common known errors cleanly
        if let urlErr = error as? URLError {
            switch urlErr.code {
            case .notConnectedToInternet:
                return UserError(
                    title: "No Internet",
                    message: "It looks like you’re offline.",
                    suggestion: "Check your connection and try again."
                )
            case .timedOut:
                return UserError(
                    title: "Taking Too Long",
                    message: "The request timed out.",
                    suggestion: "Please try again in a moment."
                )
            case .cannotFindHost, .cannotConnectToHost:
                return UserError(
                    title: "Can’t Reach Server",
                    message: "We couldn’t contact the service.",
                    suggestion: "Try again later or check your connection."
                )
            default:
                break
            }
        }

        // 2) Decoding/format issues
        if error is DecodingError {
            return UserError(
                title: "Data Issue",
                message: "We received data in an unexpected format.",
                suggestion: "Please try again shortly."
            )
        }

        // 3) Your own AppError types (optional)
        if let appErr = error as? AppError {
            return UserError(
                title: appErr.title,
                message: appErr.message,
                suggestion: appErr.suggestion
            )
        }

        // 4) Fallback for everything else (kept non-technical)
        return UserError(
            title: "Something Went Wrong",
            message: "An unexpected problem occurred.",
            suggestion: "Please try again."
        )
    }
}

/// Optional: your own domain errors can plug into the handler nicely
enum AppError: Error {
    case validation(message: String)
    case notFound
    case unauthorized
    case unknown

    var title: String {
        switch self {
        case .validation: 
            return "Check Your Input"
        case .notFound:    
            return "Not Found"
        case .unauthorized:
            return "Sign In Required"
        case .unknown:     
            return "Oops"
        }
    }

    var message: String {
        switch self {
        case .validation(let msg):
            return msg
        case .notFound:            
            return "We couldn’t find what you were looking for."
        case .unauthorized:        
            return "You don’t have permission to do that."
        case .unknown:             
            return "An unexpected error occurred."
        }
    }

    var suggestion: String {
        switch self {
        case .validation: 
            return "Please fix the highlighted fields and try again."
        case .notFound:   
            return "Try a different item or refresh."
        case .unauthorized:
            return "Please sign in and try again."
        case .unknown:    
            return "Please try again."
        }
    }
}

