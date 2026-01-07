//
//  ProductDetail.swift
//  JsonMockData
//
//  Created by Thomas Cowern on 12/22/25.
//

import SwiftUI

struct ProductDetail: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.images.first!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Text(product.title)
                .font(.title)
            Text(product.description)
        }
        .padding()
    }
}

#Preview {
    ProductDetail(product: Product.example)
}
