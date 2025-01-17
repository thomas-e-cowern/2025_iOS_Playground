//
//  ProductListScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//

import SwiftUI

struct ProductListScreen: View {
    
    @Environment(ProductStore.self) private var productStore
    
    var body: some View {
        List(productStore.products, id: \.id) { product in
            ProductCellView(product: product)
        }
        .task {
            do {
                try await productStore.loadProducts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

