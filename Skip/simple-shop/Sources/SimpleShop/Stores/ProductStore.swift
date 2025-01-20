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
    
    func saveProduct(_ product: Product) async throws {
        let newProduct = try await httpClient.saveProduct(product: product)
        
        guard let unwrappedNewProduct = newProduct else {
            return
        }
        products.append(unwrappedNewProduct)
    }
    
    func deleteProduct(product: Product) async throws {
        let deletedProduct = try await httpClient.deleteProduct(product: product)
        products = products.filter { $0.id != deletedProduct.id }
    }
}
