//
//  ProductDetailScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/20/25.
//

import SwiftUI

struct ProductDetailScreen: View {
    
    // MARK: - Variables
    let product: Product
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: product.image) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView("Loading...")
                }
                
                
                Text(product.title)
                    .font(.headline)
                Text(product.description)
                    .font(.subheadline)
                
                if product.rating != nil {
                    RatingView(rating: product.rating ?? Rating(rate: 0.0, count: 0))
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    ProductDetailScreen()
//}
