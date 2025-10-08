//
//  AppModel.swift
//  ApiServiceTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation
import Observation
import SwiftUI

// Example model
struct User: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var email: String
}

/// Shared app data (read from JSON). @Observable replaces ObservableObject/@Published.
@Observable
final class AppModel {
    var users: [User] = loadJSON("Resources/Mock/users.json")
    // Add more as needed:
    // var products: [Product] = loadJSON("Mock/products.json")
}

// Convenience for injecting the model with one line (App + Previews)
extension View {
    func withMockData(_ model: AppModel = .init()) -> some View {
        environment(model)            // <- Observation-based environment injection
    }
}

