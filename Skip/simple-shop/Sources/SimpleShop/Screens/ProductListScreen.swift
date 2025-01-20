//
//  ProductListScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//

import SwiftUI

struct ProductListScreen: View {
    
    // MARK: - Environment Variables
    @Environment(ProductStore.self) private var productStore
    
    // MARK: - State Variables
    @State private var showAddProductSheet: Bool = false
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(productStore.products, id: \.id) { product in
                NavigationLink {
                    ProductDetailScreen(product: product)
                } label: {
                    ProductCellView(product: product)
                }
            }
            .onDelete(perform: deleteProduct)
        }
        .task {
            do {
                try await productStore.loadProducts()
            } catch {
                print(error.localizedDescription)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Add Product") {
                    showAddProductSheet = true
                }
            }
        }
        .sheet(isPresented: $showAddProductSheet) {
            AddProductScreen()
        }
        .navigationTitle("Products")
    }
    
    private func deleteProduct(_ indexSet: IndexSet) {
        Task {
            do {
                for index in indexSet {
                    let product = productStore.products[index]
                    try await productStore.deleteProduct(product: product)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

