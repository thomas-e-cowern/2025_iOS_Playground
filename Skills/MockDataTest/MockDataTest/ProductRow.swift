//
//  ProductRow.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/21/25.
//

import SwiftUI

struct ProductRow: View {
    
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
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

#Preview {
    ProductRow(product: Product(id: 11, title: "Classic Red Baseball Cap", slug: "Classic Red Baseball Cap", price: 35, description: "Elevate your casual wardrobe with this timeless red baseball cap. Crafted from durable fabric, it features a comfortable fit with an adjustable strap at the back, ensuring one size fits all. Perfect for sunny days or adding a sporty touch to your outfit.", category: Category(id: 1, name: "change", slug: "change", image: "cBuLvBi"), images: [
        "cBuLvBi", "kKc9A5p", "N1GkCIR"
    ]))
}
