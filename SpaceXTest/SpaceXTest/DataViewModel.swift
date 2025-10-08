//
//  DataViewModel.swift
//  SpaceXTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

@Observable
class DataViewModel {
    var capsules: [Capsule] = []
    var launches: [Launches] = []
    
    init() {
        // Load mock data during development
        self.capsules = MockDataDecoder().loadMockData("capsules")
        self.launches = MockDataDecoder().loadMockData("launches")
    }
}
