//
//  ProductStore.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/16/25.
//

import Foundation
import Observation

@MainActor
@Observable
class ProductStore {
    let httpClient: HTTPClientProtocol
    var products: [Product] = []
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func loadProducts() async throws {
        let resource = Resource(url: API.productsUrl, modelType: [Product].self)
        products = try await httpClient.load(resource)
    }
}
