//
//  DataService.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//


protocol DataService {
    func fetchItems() async throws -> [Item]
    // Add other API methods here (e.g., saveItem, deleteItem)
}