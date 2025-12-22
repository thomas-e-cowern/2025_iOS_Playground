//
//  ProductByCategory.swift
//  JsonMockData
//
//  Created by Thomas Cowern on 12/22/25.
//

import SwiftUI

struct ProductByCategory: View {
    
    let category: Category
    
    @State var products: [Product] = load("products.json")
    
    var body: some View {
        VStack {
            List {
                ForEach(products) { product in
                    HStack {
                        NavigationLink {
                            ProductDetail(product: product)
                        } label: {
                            AsyncImage(url: URL(string: product.images.first ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            Text(product.title)
                                .font(.title)
                        }
                    }
                }
            }
            .navigationTitle(category.name)
        }
    }
}

#Preview {
    NavigationStack {
        ProductByCategory(category: Category(id: 1, name: "Rocks", slug: "rocks", image: "https://picsum.photos/200"))
    }
}
