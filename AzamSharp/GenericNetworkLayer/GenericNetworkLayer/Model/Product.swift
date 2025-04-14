//
//  Product.swift
//  GenericNetworkLayer
//
//  Created by Thomas Cowern on 4/14/25.
//
import SwiftUI

struct Product: Codable {
    let id: Int?
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
}

extension Product {
    static func byId(_ id: Int) -> Resource<Product> {
        guard let url = URL.forProductId(id) else {
            fatalError("id = \(id) was not found")
        }
        
        return Resource(url: url)
    }
    
    static var all: Resource<[Product]> {
        return Resource(url: URL.forAllProducts)
    }
}

extension URL {
    // Get one product
    static func forProductId(_ id: Int) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = "/products/\(id)"
        return components.url
    }
    // Get all products
    static var forAllProducts: URL {
        return URL(string: "https://fakestoreapi.com/products")!
    }
}
