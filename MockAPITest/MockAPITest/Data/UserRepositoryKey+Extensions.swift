//
//  UserRepositoryKey+Extensions.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

private struct UserRepositoryKey: EnvironmentKey {
    static let defaultValue: UserRepository = MockUserRepository() // default to mock
}

extension EnvironmentValues {
    var userRepository: UserRepository {
        get { self[UserRepositoryKey.self] }
        set { self[UserRepositoryKey.self] = newValue }
    }
}
