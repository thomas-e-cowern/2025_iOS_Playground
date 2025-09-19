//
//  NetworkErrors.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError(Error)
    case invalidResponse
    case unauthorized
    case notFound
    case undefined(data: String, response: Int)
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return NSLocalizedString("Bad Request (400): Unable to perform the request.", comment: "badRequestError")
        case .decodingError(let error):
            return NSLocalizedString("Unable to decode successfully. \(error)", comment: "decodingError")
        case .invalidResponse:
            return NSLocalizedString("Invalid response.", comment: "invalidResponse")
        case .unauthorized:
            return NSLocalizedString("Unauthorized credentials.", comment: "authorizationError")
        case .notFound:
            return NSLocalizedString("Resource not found (404).", comment: "notFoundError")
        case .undefined(let data, let response):
            return "An unexpected error occurred. Status code: \(response).  Data: \(data)"
        }
    }
    
    var title: String {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .decodingError(_):
            return "Decoding Error"
        case .invalidResponse:
            return "Invaldi Response"
        case .unauthorized:
            return "Unathorized Title"
        case .notFound:
            return "Not Found"
        case .undefined(data: let data, response: let response):
            return "Undefinded Error. Status code: \(response).  Data: \(data)"
        }
    }
}

struct ErrorResponse: Codable {
    let message: String?
}
