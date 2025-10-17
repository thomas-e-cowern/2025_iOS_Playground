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
        var (data, response) = try await environment.session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response type")
            throw URLError(.badServerResponse)
        }
        
        if (200...299).contains(httpResponse.statusCode) {
            // Request was successful
            print("Status code: \(httpResponse.statusCode)")
            
            if let keyPath = resource.keyPath {
                if let rootObject = try JSONSerialization.jsonObject(with: data) as? NSDictionary {
                    if let nestedObject = rootObject.value(forKeyPath: keyPath) {
                        data = try JSONSerialization.data(withJSONObject: nestedObject, options: .fragmentsAllowed)
                    }
                }
            }
            
            // Process data
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } else {
            // Server returned an error status code
            print("Server error: \(httpResponse.statusCode)")
            throw URLError(.badServerResponse)
        }
    }
    
    // Adds retry support if desired
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil, attempts: Int, retryDelay: Double = 1) async throws -> T {
        do {
            print("Attempting to fetch (Attempts remaining: \(attempts)")
            return try await fetch(resource, with: data)
        } catch {
            if attempts > 1 {
                try await Task.sleep(for: .milliseconds(Int(retryDelay * 1000)))
                return try await fetch(resource, with: data, attempts: attempts - 1, retryDelay: retryDelay)
            } else {
                throw error
            }
        }
    }
    
    // Returns a default value - which doesn't exist at this point.
    func fetch<T>(_ resource: Endpoint<T>, with data: Data? = nil, defaultValue: T) async throws -> T {
        do {
            return try await fetch(resource, with: data)
        } catch {
            return defaultValue
        }
    }
}
