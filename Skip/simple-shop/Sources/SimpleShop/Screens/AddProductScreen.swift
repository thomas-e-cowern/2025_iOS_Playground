//
//  AddProductScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/19/25.
//

import SwiftUI

struct AddProductScreen: View {
    
    // MARK: - Variables
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var category: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Price", text: $price)
            TextField("Category", text: $category)
            TextEditor(text: $description)
                .frame(height: 200)
            Button("Add Product") {
                // MARK: TODO - add product code here
            }
        }
    }
}

#Preview {
    AddProductScreen()
}
