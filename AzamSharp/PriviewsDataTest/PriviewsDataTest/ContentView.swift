//
//  ContentView.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    
    let httpClient: HTTPClient
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            List(products, id: \.id) { product in
                Text(product.title)
            }
            .task {
                await loadProducts()
            }
        }
        .padding()
    }
    
    private func loadProducts() async  {
        let response = Resource(url: API.productsUrl, modelType: [Product].self)
        do {
            products = try await httpClient.load(response)
        } catch {
            print("Problem in loadProducts in ContentView \(error)")
        }
    }
}

#Preview {
    ContentView(httpClient: HTTPClient())
}
