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
    
    #if DEBUG
    static let example = Product(id: 13, title: "Classic Olive Chino Shorts", slug: "classic-olive-chino-shorts", price: 84, description: "Elevate your casual wardrobe with these classic olive chino shorts. Designed for comfort and versatility, they feature a smooth waistband, practical pockets, and a tailored fit that makes them perfect for both relaxed weekends and smart-casual occasions. The durable fabric ensures they hold up throughout your daily activities while maintaining a stylish look.", category: Category(id: 1, name: "Clothes", slug: "clothes", image: "https://i.imgur.com/QkIa5tT.jpeg"), images: [
        "https://i.imgur.com/UsFIvYs.jpeg",
        "https://i.imgur.com/YIq57b6.jpeg"
      ])
    #endif
}

struct Category: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let slug: String
    let image: String
}
