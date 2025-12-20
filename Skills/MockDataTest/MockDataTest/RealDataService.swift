//
//  RealDataService.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import Foundation

class RealDataService: DataService {
    func fetchItems() async throws -> [Item] {
        guard let url = URL(string: "api.yourwebsite.com") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Item].self, from: data)
    }
}
