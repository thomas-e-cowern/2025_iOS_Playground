//
//  Item.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import Foundation

struct Item: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
}
