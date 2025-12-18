//
//  AppError.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import Foundation

enum AppError: LocalizedError, Equatable, Identifiable {
    case networkError(String)
    case parsingError(String)
    case unknownError

    var id: String { errorDescription ?? UUID().uuidString }

    var errorDescription: String? {
        switch self {
        case .networkError(let details):
            return "Network error: \(details)"
        case .parsingError(let details):
            return "Parsing failed: \(details)"
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
