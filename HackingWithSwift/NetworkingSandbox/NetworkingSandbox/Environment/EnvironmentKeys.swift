//
//  EnvironmentKeys.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import SwiftUI

struct NetworkManagerKey: EnvironmentKey {    
    static var defaultValue = NetworkManager(environment: .testing)
}

extension EnvironmentValues {
    var networkManager: NetworkManager {
        get { self[NetworkManagerKey.self] }
        set { self[NetworkManagerKey.self] = newValue }
    }
}
