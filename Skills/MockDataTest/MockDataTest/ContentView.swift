//
//  ContentView.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dataService) private var dataService
    @State private var products: [Product] = []
    @State private var isLoading = false
    var jsonProducts: [Product] = load("Products")

    var body: some View {
        VStack {
            List {
                ForEach(jsonProducts) { product in
                    ProductRow(product: product)
                }
            }
        }
//        .task {
//            isLoading = true
//            products = try! await dataService.fetchItems()
//            isLoading = false
//        }
    }
}

#Preview {
    ContentView()
}
