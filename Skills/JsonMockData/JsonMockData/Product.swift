//
//  Product.swift
//  JsonMockData
//
//  Created by Thomas Cowern on 12/22/25.
//

import Foundation

struct Product: Codable, Identifiable, Equatable {
    let id: Int
    let title, slug: String
    let price: Int
    let description: String
    let category: Category
    let images: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id, title, slug, price, description, category, images
    }
}

struct Category: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let slug: String
    let image: String
}

