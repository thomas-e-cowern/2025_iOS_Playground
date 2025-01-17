//
//  ProductCellView.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//

import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: product.image) { image in
                image.resizable()
            } placeholder: {
                ProgressView("Loading")
            }
            .frame(width: 50, height: 50)
            Text(product.title)
        }
    }
}
