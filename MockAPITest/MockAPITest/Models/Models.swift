//
//  Models.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let email: String
}

struct Order: Identifiable, Decodable {
    let id: Int
    let userId: Int
    let total: Double
}
