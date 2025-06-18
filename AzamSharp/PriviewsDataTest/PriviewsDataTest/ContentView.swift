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
                try? await productStore.loadProducts()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .environment(ProductStore(httpClient: MockHTTPClient()))
}
