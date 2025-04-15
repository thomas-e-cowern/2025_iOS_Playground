//
//  Blog.swift
//  GlitchBlogTest
//
//  Created by Thomas Cowern on 4/1/25.
//

import Foundation

struct Blog: Codable, Hashable {
    let title: String
    let snippet: String
    let body: String
}

extension URL {
    // Get all blogs
    static var allBlogs: URL {
        return URL(string: "https://glittery-checker-tanker.glitch.me")!
    }
}

extension Blog {
    static var allBlogs: Resource<[Blog]> {
        return Resource(url: URL.allBlogs)
    }
}

//extension Product {
//    static func byId(_ id: Int) -> Resource<Product> {
//        guard let url = URL.forProductId(id) else {
//            fatalError("id = \(id) was not found")
//        }
//        
//        return Resource(url: url)
//    }
//    
//    static var all: Resource<[Product]> {
//        return Resource(url: URL.forAllProducts)
//    }
//}
//
//extension URL {
//    // Get one product
//    static func forProductId(_ id: Int) -> URL? {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "fakestoreapi.com"
//        components.path = "/products/\(id)"
//        return components.url
//    }
//    // Get all products
//    static var forAllProducts: URL {
//        return URL(string: "https://fakestoreapi.com/products")!
//    }
//}
