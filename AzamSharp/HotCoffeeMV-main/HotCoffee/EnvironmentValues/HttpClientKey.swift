//
//  HttpClientKey.swift
//  HotCoffee
//
//  Created by Thomas Cowern on 5/5/25.
//
import SwiftUI

private struct HttpClientKey: EnvironmentKey {
    static let defaultValue: HTTPClient = HTTPClient()
}

extension EnvironmentValues {
    var httpClient: HTTPClient {
        get {
            self[HttpClientKey.self]
        } set {
            self[HttpClientKey.self] = newValue
        }
    }
}
