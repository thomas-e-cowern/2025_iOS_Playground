//
//  ContentView.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ProductStore.self) private var productStore
    
    var body: some View {
        VStack {
            List(productStore.products, id: \.id) { product in
                Text(product.title)
            }
            .task {
                await loadProducts()
            }
        }
    }
    
    private func loadProducts() async {
        do {
            try await productStore.loadProducts()
        } catch {
            print("Error in loadingProducts: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
        .environment(ProductStore(httpClient: HTTPClient()))
}
