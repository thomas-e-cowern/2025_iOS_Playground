//
//  MockDataService.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import Foundation

class MockDataService: DataService {
    func fetchItems() async throws -> [Product] {
        // Simulate network delay
        try? await Task.sleep(for: .seconds(1))
        return [
            Product(id: 11, title: "Classic Red Baseball Cap", slug: "Classic Red Baseball Cap", price: 35, description: "Elevate your casual wardrobe with this timeless red baseball cap. Crafted from durable fabric, it features a comfortable fit with an adjustable strap at the back, ensuring one size fits all. Perfect for sunny days or adding a sporty touch to your outfit.", category: Category(id: 1, name: "change", slug: "change", image: "cBuLvBi"), images: [
                "cBuLvBi", "kKc9A5p", "N1GkCIR"
            ]),
            Product(id: 12, title: "Classic Black Baseball Cap", slug: "Classic Black Baseball Cap", price: 58, description: "Elevate your casual wear with this timeless black baseball cap. Made with high-quality, breathable fabric, it features an adjustable strap for the perfect fit. Whether you’re out for a jog or just running errands, this cap adds a touch of style to any outfit.", category: Category(id: 1, name: "change", slug: "change", image: "KeqG6r4"), images: [
                "KeqG6r4", "xGQOw3p", "https://i.imgur.com/oO5OUjb.jpeg"
            ])
        ]
    }
}
// Old data
//Item(id: UUID(), name: "Sample Item 1", description: "This is a description for a sample item."),
//Item(id: UUID(), name: "Sample Item 2", description: "Another description for another item."),
//Item(id: UUID(), name: "Sample Item 3", description: "The final description.")
