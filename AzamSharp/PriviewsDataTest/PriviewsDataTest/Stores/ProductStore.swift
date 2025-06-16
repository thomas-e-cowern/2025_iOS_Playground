//
//  ProductStore.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/16/25.
//

import Foundation

@MainActor
@Observable
class ProductStore {
    let httpClient: HTTPClient
    var products: [Product] = []
    
    init(httpClient: HTTPClient, products: [Product]) {
        self.httpClient = httpClient
        self.products = products
    }
    
    func loadProducts() async throws {
        let resource = Resource(url: API.productsUrl, modelType: [Product].self)
        products = try await httpClient.load(resource)
    }
}
