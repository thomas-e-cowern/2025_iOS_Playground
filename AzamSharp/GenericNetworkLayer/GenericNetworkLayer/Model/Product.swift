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
    
    static func forProductId(_ id: Int) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = "/products/\(id)"
        return components.url
    }
    
    static var all: Resource<[Product]> {
        return Resource(url: URL.forAllProducts)
    }
}

extension URL {
    static var forAllProducts: URL {
        return URL(string: "https://fakestoreapi.com/products")!
    }
}
