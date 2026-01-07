//
//  ContentView.swift
//  JsonMockData
//
//  Created by Thomas Cowern on 12/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var products: [Product] = load("products.json")
    @State var categories: [Category] = load("categories.json")
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(categories) { category in
                        NavigationLink {
                            ProductByCategory(category: category)
                        } label: {
                            AsyncImage(url: URL(string: category.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            Text(category.name)
                                .font(.title)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
