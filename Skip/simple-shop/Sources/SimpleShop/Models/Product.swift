//
//  Product.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/17/25.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: Int?
    var title: String
    var price: Double
    var category: String
    var description: String
    var image: URL
    var rating: Rating
}


