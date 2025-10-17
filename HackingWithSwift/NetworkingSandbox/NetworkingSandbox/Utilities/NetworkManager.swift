//
//  NetworkManager.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import Foundation

enum HTTPMethod: String {
    case delete, get, patch, post, put

    var rawValue: String {
        String(describing: self).uppercased()
    }
}

struct NetworkManager {
    
    var environment: AppEnvironment
    
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil) async throws -> T {
        
        guard let url = URL(string: resource.path, relativeTo: environment.baseURL) else {
            throw URLError(.unsupportedURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = resource.method.rawValue
        request.allHTTPHeaderFields = [:]
        request.httpBody = data
        request.allHTTPHeaderFields = resource.headers
        let (data, response) = try await environment.session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response type")
            throw URLError(.badServerResponse)
        }
        
        if (200...299).contains(httpResponse.statusCode) {
            // Request was successful
            print("Status code: \(httpResponse.statusCode)")
            // Process data
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } else {
            // Server returned an error status code
            print("Server error: \(httpResponse.statusCode)")
            throw URLError(.badServerResponse)
        }
    }
}
