//
//  DataFetching.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/9/25.
//

import Foundation

protocol DataFetching: Sendable {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: DataFetching { }
