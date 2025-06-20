//
//  ActivityModel.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import Foundation

struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let imageName: String
    let amount: String
    
    static let example: [Activity] = [
        Activity(id: 0, title: "Steps", subtitle: "Goal: 10,000", imageName: "figure.walk", amount: "6,295")
    ]
}
