//
//  CapsuleFetching.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

protocol CapsuleFetching {
    func fetchCapsule() async throws -> [CapsuleElement]
}
