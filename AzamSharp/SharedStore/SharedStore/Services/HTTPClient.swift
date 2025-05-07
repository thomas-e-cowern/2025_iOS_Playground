//
//  HTTPClient.swift
//  SharedStore
//
//  Created by Thomas Cowern on 5/7/25.
//
import SwiftUI

enum EndPoint {
    case patients
    case allergies(UUID)
}

struct HTTPClient {
    func load<T>(_ endpoint: EndPoint) async throws -> [T] {
        return []
    }
}
