//
//  NetworkManager.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import Foundation

struct NetworkManager {
    func fetch<T>(_ resource: Endpoint<T>) async throws -> T {
        let request = URLRequest(url: resource.url)
        let (data, response) = try await URLSession.shared.data(for: request)
        
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
