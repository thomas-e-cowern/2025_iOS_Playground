//
//  HTTPClient.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import Foundation

protocol HTTPClientProtocol {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T
}

struct Resource<T: Codable> {
    let url: URL
    var method: HTTPMethod = .get([])
    var headers: [String: String]? = nil
    var modelType: T.Type
}
enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    case put(Data?)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .put:
            return "PUT"
        }
    }
}
