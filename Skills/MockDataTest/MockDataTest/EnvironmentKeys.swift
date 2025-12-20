//
//  EnvironmentKeys.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

// Define a custom EnvironmentKey
private struct DataServiceKey: EnvironmentKey {
    static let defaultValue: any DataService = MockDataService() // Default to mock for previews
}

extension EnvironmentValues {
    var dataService: any DataService {
        get { self[DataServiceKey.self] }
        set { self[DataServiceKey.self] = newValue }
    }
}
