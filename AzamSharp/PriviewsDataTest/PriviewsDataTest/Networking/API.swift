//
//  API.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/15/25.
//

import Foundation

struct API {
    static let baseUrl = URL(string: "https://api.escuelajs.co/api/v1/")!
    static let productsUrl = URL(string: "products", relativeTo: baseUrl)!
}
