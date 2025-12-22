//
//  ContentView.swift
//  JsonMockData
//
//  Created by Thomas Cowern on 12/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var products: [Product] = load("products.json")
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(products) { product in
                        HStack {
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
            .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}
