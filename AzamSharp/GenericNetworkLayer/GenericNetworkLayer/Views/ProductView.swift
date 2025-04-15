//
//  ProductView.swift
//  GenericNetworkLayer
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

struct ProductView: View {
    
    var productId: Int?
    @State var product: Product?
    
    var body: some View {
        VStack {
            Text(product?.title ?? "No product Id")
        }
        .task {
            await getProduct(2)
        }
    }
    
    func getProduct(_ id: Int) async {
        do {
            product = try await Webservice().load(Product.byId(1))
        } catch {
            print("Error getting single product: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ProductView(product: Product(id: 1, title: "Test Product", price: 12.50, description: "Product Description", image: "", category: "Clothing"))
}
