//
//  MyError.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import Foundation

enum MyError: LocalizedError {
    case custom
    
    var errorDescription: String? {
        switch self {
        case .custom:
            return "Custom Error"
        }
    }
}
