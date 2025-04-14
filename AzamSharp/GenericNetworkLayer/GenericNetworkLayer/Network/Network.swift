//
//  Network.swift
//  GenericNetworkLayer
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

class Webservice {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        
        var request = URLRequest(url: resource.url)
        
        switch resource.method {
        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
        case .get(let queryItems):  //https://someurl.com/products?sort=asc&pageSize=10
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                print("Bad URL Error")
                throw NetworkingError.badUrl
            }
            request = URLRequest(url: url)
        }
        
        // URLSession configuration
        let configuration = URLSessionConfiguration.default
        // Default headers
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        
        // Check the network response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Network Response Error")
            throw NetworkingError.invalidResponse
        }
        
        // Decode the data
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            print("Network Decoding Error")
            throw NetworkingError.decodingError
        }
        
        return decodedData
    }
}

struct Resource<T: Codable> {
    let url: URL
    let method: HttpMethod = .get([])
}

// Enums for Network....
enum NetworkingError: Error {
    case invalidResponse
    case badUrl
    case decodingError
}

enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
