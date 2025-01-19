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
    
    func saveProduct(product: Product) async throws -> Product? {
        var request = URLRequest(url: URL(string: "https://example.com/api/products")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(product)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let newProduct = try JSONDecoder().decode(Product.self, from: data)
        return newProduct
    }
}
