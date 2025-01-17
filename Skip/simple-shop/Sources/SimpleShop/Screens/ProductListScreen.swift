//
//  ProductListScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//

import SwiftUI

struct ProductListScreen: View {
    var body: some View {
        List(1...50, id: \.self) { index in
            Text("Product \(index)")
        }
    }
}

