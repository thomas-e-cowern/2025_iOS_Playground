//
//  NetworkError.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/14/25.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
    case invalidURL
    
    var errorDescription: String {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .serverError(let message):
            return message
        case .decodingError:
            return "Decoding Error"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidURL:
            return "Invalid URL"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .badRequest:
            return "The server did not understand the request."
        case .serverError(let message):
            return message
        case .decodingError:
            return "Error decoding JSON."
        case .invalidResponse:
            return "The server did not return a valid response."
        case .invalidURL:
            return "The URL provided was invalid."
        }
    }
}


