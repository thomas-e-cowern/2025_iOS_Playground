//
//  Rating.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/20/25.
//

import Foundation

struct Rating: Codable {
    let rate: Double
    let count: Int
    
    func rateToString() -> String {
        return "Rating: " + String(format: "%.1f", rate)
    }
    
    func countToString() -> String {
        return "Ratings: \(count)"
    }
}
