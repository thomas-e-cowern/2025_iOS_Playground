//
//  RealDataService.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import Foundation

class RealDataService: DataService {
    func fetchItems() async throws -> [Product] {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products/") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        let statusCode = httpResponse.statusCode
        
        print("Status code: \(statusCode)")
        let decoder = JSONDecoder()
        return try decoder.decode([Product].self, from: data)
    }
}
