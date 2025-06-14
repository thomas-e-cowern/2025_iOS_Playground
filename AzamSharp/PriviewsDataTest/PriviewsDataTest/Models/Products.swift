//
//  Products.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, slug: String
    let price: Int
    let description: String
//    let category: Category
    let images: [String]
    let creationAt, updatedAt: String
}

// MARK: - Category
//struct Category: Codable {
//    let id: Int
//    let name: Name
//    let slug: Slug
//    let image: String
//    let creationAt, updatedAt: At
//}
//
//enum At: String, Codable {
//    case the20250612T022022000Z = "2025-06-12T02:20:22.000Z"
//}
//
//enum Name: String, Codable {
//    case clothes = "Clothes"
//    case electronics = "Electronics"
//    case furniture = "Furniture"
//}
//
//enum Slug: String, Codable {
//    case clothes = "clothes"
//    case electronics = "electronics"
//    case furniture = "furniture"
//}

typealias Products = [Product]

