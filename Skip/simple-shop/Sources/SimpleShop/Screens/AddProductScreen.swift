//
//  AddProductScreen.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/19/25.
//

import SwiftUI

struct AddProductScreen: View {
    
    // MARK: - Environment values
    @Environment(ProductStore.self) private var productStore
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Variables
    @State private var title: String = ""
    @State private var price: String = ""
    @State private var category: String = ""
    @State private var description: String = ""
    
    let categories: [String] = ["Electronics", "jewelery", "men's clothing", "women's clothing"]
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Price", text: $price)
            Picker("Category", selection: $category) {
                Text("Choose Category").tag("choose")
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .tag(category)
                }
            }
            TextEditor(text: $description)
                .frame(height: 200)
            Button("Add Product") {
                guard let price = Double(price) else { return }
                let product = Product(title: title, price: price, category: category, description: description, image: URL(string: "https://picsum.photos/200/200")!, rating: Rating(rate: 4.5, count: 150))
                
                Task {
                    do {
                        try await productStore.saveProduct(product)
                        dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    AddProductScreen()
}
