//
//  ProductDetailScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/20/25.
//

import SwiftUI

struct ProductDetailScreen: View {
    
    let product: Product
    
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
                
                RatingView(rating: product.rating)
            }
            .padding()
        }
    }
}

//#Preview {
//    ProductDetailScreen()
//}
