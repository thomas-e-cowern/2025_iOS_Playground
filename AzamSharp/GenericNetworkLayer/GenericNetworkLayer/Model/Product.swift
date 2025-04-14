//
//  Product.swift
//  GenericNetworkLayer
//
//  Created by Thomas Cowern on 4/14/25.
//
import SwiftUI

struct Product: Codable {
    let id: Int?
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
}
