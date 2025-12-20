//
//  MockDataService.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import Foundation

class MockDataService: DataService {
    func fetchItems() async throws -> [Item] {
        // Simulate network delay
        try? await Task.sleep(for: .seconds(1))
        return [
            Item(id: UUID(), name: "Sample Item 1", description: "This is a description for a sample item."),
            Item(id: UUID(), name: "Sample Item 2", description: "Another description for another item."),
            Item(id: UUID(), name: "Sample Item 3", description: "The final description.")
        ]
    }
}
