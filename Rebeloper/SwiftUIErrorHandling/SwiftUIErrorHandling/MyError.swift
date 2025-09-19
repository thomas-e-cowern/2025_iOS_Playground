//
//  MyError.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import Foundation

enum MyError: LocalizedError {
    case custom
    case networkError
    
    var title: String? {
        switch self {
        case .custom:
            return "Custom Title"
        case .networkError:
            return "Network Error"
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .custom:
            return "Custom Error"
        case .networkError:
            return "Network Error"
        }
    }
}
