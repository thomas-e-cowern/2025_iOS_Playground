//
//  File.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//

import Foundation
import Observation

@Observable
class ProductStore {
    
    let httpClient: HTTPClient
    var products: [Product] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadProducts() async throws {
        
        let productsUrl = URL(string: "https://fakestoreapi.com/products")!
        
        products = try await httpClient.fetchProducts(url: productsUrl)
    }
}
