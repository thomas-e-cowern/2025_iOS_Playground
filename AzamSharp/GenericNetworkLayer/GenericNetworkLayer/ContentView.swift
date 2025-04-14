//
//  ContentView.swift
//  GenericNetworkLayer
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            if !products.isEmpty {
                ForEach(products, id: \.id) { product in
                    Text(product.title)
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .task {
            await loadProducts()
        }
    }
        
    
    func loadProducts() async {
        do {
            products = try await Webservice().load(Product.all)
        } catch {
            print("There was a problem getting the products")
        }
    }
}

#Preview {
    ContentView()
}
