//
//  MockHTTPClient.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import Foundation

struct MockHTTPClient: HTTPClientProtocol {
    func load<T>(_ resource: Resource<T>) async throws -> T where T : Decodable, T : Encodable {
        print("Inside MockHTTPClient load")
        guard let filename = resource.url.pathComponents.last else {
            print("Error in MockHTTPClient getting fileName")
            throw URLError(.badURL)
        }
        
        let jsonFreeFileName = filename.replacingOccurrences(of: "json", with: "")
        
        return PreviewData.load(jsonFreeFileName)
    }
}
