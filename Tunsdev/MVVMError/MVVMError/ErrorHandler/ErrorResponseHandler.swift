//
//  ResponseHander.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//
import Foundation

enum NetworkError: Error {
    case missingRequiredFields(String)
    case invalidParameters(operation: String, parameters: [Any])
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case requestEntityTooLarge
    case unprocessableEntity
    case http(httpResponse: HTTPURLResponse, data: Data)
    case invalidResponse(Data)
    case deleteOperationFailed(String)
    case network(URLError)
    case unknown(Error?)
    
    var description: String {
        switch self {
        case .missingRequiredFields:
            return "Missing required fields"
        case .invalidParameters:
            return ("Someting is wrong with the parameters")
        case .badRequest:
            return "The server could not process a request because of a client error"
        case .unauthorized:
            return "Unauthorized"
        case .paymentRequired:
            return "Payment Required"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            print("Not Found")
            return "Not Found"
        case .requestEntityTooLarge:
            return "Request Entity Too Large"
        case .unprocessableEntity:
            return "Unprocessable Entity"
        case .http:
            return "HTTP response error"
        case .invalidResponse:
            return "Invalid Response"
        case .deleteOperationFailed:
            return "Delete operation failed"
        case .network:
            return "Network Error"
        case .unknown(let error):
            return "Unknown Error: \(String(describing: error))"
        }
    }

}

enum URLError: Error {
    case invalidURL
    
    var description: String {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid"
        }
    }
}

struct ErrorResponseHandler: Error {
    
    func handleResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
        }
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 402:
            throw NetworkError.paymentRequired
        case 403:
            throw NetworkError.forbidden
        case 404:
            print("Not Found")
            throw NetworkError.notFound
        case 413:
            throw NetworkError.requestEntityTooLarge
        case 422:
            throw NetworkError.unprocessableEntity
        default:
            throw NetworkError.http(httpResponse: httpResponse, data: response.data)
        }
    }
}

enum ErrorType: Error {
    case networkError
    case userError
}

struct ErrorNotification {
    
    func showError(errorType: ErrorType, error: Error) {
        print("errorType: \(errorType), error: \(error)")
    }
}
