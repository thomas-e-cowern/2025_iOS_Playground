//
//  MockCapsuleFetcher.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

enum MockCapsuleFetcher: CapsuleFetching {
    func fetchCapsule() async throws -> [CapsuleElement] {
        return []
    }
}
