//
//  HTTPClient.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//
import Foundation

struct HTTPClient {
    func fetchProducts(url: URL) async throws -> [Product] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedProducts = try JSONDecoder().decode([Product].self, from: data)
        return decodedProducts
    }
}
